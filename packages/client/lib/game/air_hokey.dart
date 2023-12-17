import 'dart:convert';

import 'package:air_hokey_client/components/my_world.dart';
import 'package:air_hokey_client/game/game_start_status.dart';
import 'package:flame/components.dart';
import 'package:model/client_declaration/client_declaration.dart';
import 'package:model/game_config/constants.dart';
import 'package:model/game_state/game_state.dart';
import 'package:model/handshake/handshake.dart';
import 'package:model/reset/reset.dart';
import 'package:model/start/start.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:air_hokey_client/components/button/start_button.dart';
import 'package:air_hokey_client/components/countdown_text.dart';
import 'package:air_hokey_client/components/debug_text.dart';
import 'package:air_hokey_client/components/field.dart';
import 'package:air_hokey_client/components/paddle/draggable_paddle.dart';
import 'package:air_hokey_client/components/paddle/opponent_paddle.dart';
import 'package:air_hokey_client/repository/web_socket_repository.dart';
import 'package:air_hokey_client/state/user.dart';

import '../components/ball.dart';
import '../constants/constants.dart';

class AirHokey extends FlameGame with HasCollisionDetection, KeyboardEvents {
  AirHokey({required this.isDebug, required this.id}) {
    webSocketRepository = WebSocketRepository(isDebug: isDebug, id: id);
  }

  final bool isDebug;
  final String id;
  late final WebSocketRepository webSocketRepository;
  User? user;
  GameState? gameState;
  Ball? ball;
  DraggablePaddle? _draggablePaddle;

  final debugText = DebugText();
  StartButton? startButton;
  bool shouldCalc = false;

  final fieldSize = Vector2(kFieldSizeX, kFieldSizeY);
  final paddleSize = Vector2(kPaddleWidth, kPaddleHeight);
  @override
  Future<void>? onLoad() async {
    super.world = MyWorld(Vector2(size.x, size.y));
    super.camera = CameraComponent(world: super.world);
    super.camera.viewfinder.anchor = Anchor.topLeft;
    final opponentPaddle = OpponentPaddle(
      paddleSize: paddleSize,
      fieldSize: fieldSize,
      gameSize: size,
    );
    startButton = StartButton(
      onTap: _onTapStartButton,
      gameSize: size,
    );

    _draggablePaddle = DraggablePaddle(
        draggingPaddle: _draggingPaddle,
        paddleSize: paddleSize,
        fieldSize: fieldSize,
        gameSize: size);

    ball = Ball(size);
    _startWebSocketConnection(opponentPaddle);
    await addAll([
      world,
      _draggablePaddle!,
      opponentPaddle,
      startButton!,
      if (isDebug) debugText,
    ]);
  }

  // ループごとの衝突判定を消している。
  @override
  void update(double dt) {
    final myWorld = super.world as MyWorld;
    final field = myWorld.field;
    if (field != null) {
      if (size.x > fieldSize.x * 1.5) {
        // 並行移動してFieldを画面の中心にする
        final deltaX = (size.x - field.position.x * 2) / 2;
        super.camera.viewport.position = Vector2(deltaX, 0);
        final deltaY = (size.y - field.position.y * 2) / 2;
        super.camera.viewport.position = Vector2(deltaX, deltaY);
      } else {
        final scale = size.x / (fieldSize.x * 1.5);
        print("Scale: $scale");
        // 縮小して、Fieldを画面サイズに合わせる。
        super.camera.viewfinder.zoom = scale;
      }
    }

    super.update(dt);
    debugText.updateText([
      user?.debugViewText,
      gameState?.debugViewText,
      ball?.getDebugViewText(size)
    ]);
    if (gameState?.ids.length == 2) {
      startButton?.setEnable();
    }
    if (shouldCalc) {
      _calcPositionAndSendState(gameState!);
      shouldCalc = false;
    }
  }

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is RawKeyDownEvent;

    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    if (isSpace && isKeyDown) {
      webSocketRepository.sendReset(
        Reset(
          id: user!.id,
          userRole: user!.userRole,
        ),
      );

      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  void _startWebSocketConnection(
    OpponentPaddle opponentPaddle,
  ) {
    final s = webSocketRepository.getChannel().map((event) {
      final json = jsonDecode(event);
      switch (json['type']) {
        case 'gameState':
          return GameState.fromJson(json['responseDetail']);
        case 'handshake':
          final handShake = Handshake.fromJson(json['responseDetail']);
          user = User(id: handShake.id, userRole: handShake.userRole);
          return handShake.gameState;
        default:
          throw Exception('Unknown response type');
      }
    });
    s.listen((gameState) async {
      if (user == null) return;
      if (gameState.isReset) {
        _onReset();
        return;
      }
      if (gameState.isGoal) {
        _onGoal(gameState);
        return;
      }
      final localGameState = this.gameState;
      opponentPaddle.updatePosition(gameState, user!);
      // ここでpositionを更新する
      this.gameState = gameState;
      // 2人揃っていない場合は早期リターン
      if (gameState.ids.length < 2) {
        return;
      }
      switch (GameStartStatus.fromGameState(localGameState, gameState)) {
        case GameStartStatus.atStart:
          _onStart(gameState);
          return;
        case GameStartStatus.afterStart:
          _onAfterStart(gameState);
          return;
        case GameStartStatus.atReset || GameStartStatus.beforeStart:
          return;
      }
    });
  }

  void _onStart(GameState gameState) async {
    startButton?.removeFromParent();
    ball = Ball(size);
    ball?.draw(gameState.ballState, user, size);
    await _countdown();
    add(ball!);
    _calcPositionAndSendState(gameState);
  }

  void _onAfterStart(GameState gameState) {
    // 両方のクライアントからのボール宣言がnullの場合のみ描画する。
    // ここでは片方のボール宣言がnon-nullの場合は早期リターン
    if (gameState.isRequestedBallStateFromOtherClient) {
      return;
    }
    // ボールの位置を描画
    ball?.draw(gameState.ballState, user, size);
    shouldCalc = true;
  }

  void _calcPositionAndSendState(GameState gameState) {
    // ボールの位置を計算
    ball?.calcPositionForRequest(user, size);
    // 新しいボールの位置を送信する
    final relativeX = -1 *
        (_draggablePaddle!.position.x -
            (size.x / 2 - _draggablePaddle!.size.x / 2));
    final clientDeclaration = ClientDeclaration(
      id: user!.id,
      paddlePosition: relativeX.toInt(),
      ballState: ball!.getBallState(size, user!),
      serverLoopCount: gameState.serverLoop,
    );
    webSocketRepository.sendClientDeclaration(clientDeclaration);
  }

  void _draggingPaddle(DragUpdateEvent event) {
    final paddle = children.whereType<DraggablePaddle>().first;

    paddle.position.x += event.delta.x.round();

    if (paddle.position.x < 0) {
      paddle.position.x = 0;
    }
    if (paddle.position.x > size.x - paddle.size.x) {
      paddle.position.x = size.x - paddle.size.x;
    }
  }

  Future<void> _onTapStartButton() async {
    ball = Ball(size);
    final start =
        Start(id: user!.id, ballState: ball!.getBallState(size, user!));
    webSocketRepository.sendStart(start);
  }

  Future<void> _countdown() async {
    final countdownText = CountdownText(gameSize: size);
    await add(countdownText);

    countdownText.pointText(gameState!, user!);
    await Future<void>.delayed(const Duration(seconds: 1));
    for (var i = kCountdownDuration; i > 0; i--) {
      countdownText.updateCount(i);
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    countdownText.removeFromParent();
  }

  void _onReset() {
    webSocketRepository.close();
    ball?.removeFromParent();
    ball = Ball(size);
    startButton?.setEnable();
    _draggablePaddle = DraggablePaddle(
        draggingPaddle: _draggingPaddle,
        paddleSize: paddleSize,
        fieldSize: fieldSize,
        gameSize: size);
  }

  void _onGoal(GameState gameState) {
    ball?.removeFromParent();
    if (startButton == null) {
      return;
    }
    this.gameState = gameState;
    add(startButton!);
  }
}
