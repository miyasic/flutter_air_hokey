import 'dart:convert';

import 'package:air_hokey_server/game/client_game_state/client_game_state.dart';
import 'package:air_hokey_server/game/game_state/game_state.dart';
import 'package:air_hokey_server/game/handshake/handshake.dart';
import 'package:air_hokey_server/game/position_state/position_state.dart';
import 'package:air_hokey_server/game/reset/reset.dart';
import 'package:air_hokey_server/game/start/start.dart';
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
  final webSocketRepository = WebSocketRepository();
  User? user;
  GameState? gameState;
  Ball? ball;
  DraggablePaddle? _draggablePaddle;

  final debugText = DebugText();
  StartButton? startButton;
  bool shouldCalc = false;

  @override
  Future<void>? onLoad() async {
    collisionDetection.run();
    final fieldSize = Vector2(400, 600);
    final paddleSize = Vector2(kPaddleWidth, kPaddleHeight);
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
      Field(
        gameSize: size,
        fieldSize: fieldSize,
        paint: BasicPalette.darkBlue.paint(),
      ),
      _draggablePaddle!,
      opponentPaddle,
      startButton!,
      if (isDebug) debugText,
    ]);
  }

  // ループごとの衝突判定を消している。
  @override
  void update(double dt) {
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
      calcPositionAndSendState(gameState!);
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

    if (!isDebug) {
      return KeyEventResult.ignored;
    }
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
      print(json['type']);
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
      final isStart =
          this.gameState?.ballState == null && gameState.ballState != null;
      // ここでpositionを更新する
      this.gameState = gameState;
      opponentPaddle.updatePosition(gameState, user!);
      // ローカルではballStateがnullかつサーバー側のballStateがnullではない場合(1回のみ)
      if (isStart) {
        // ボタンはタップされたら削除
        startButton?.removeFromParent();
        ball?.draw(gameState.ballState, user, size);
        await _countdown();
        add(ball!);
        calcPositionAndSendState(gameState);
        return;
      }

      if (gameState.ballStateMap.isNotEmpty) {
        // 情報が出揃っていないということなので無視
        return;
      }
      // ボールの位置を描画
      ball?.draw(gameState.ballState, user, size);

      shouldCalc = true;
    });
  }

  void calcPositionAndSendState(GameState gameState) {
    // ボールの位置を計算
    ball?.calcPositionForRequest(user, size);
    // 新しいボールの位置を送信する
    final relativeX = -1 *
        (_draggablePaddle!.position.x -
            (size.x / 2 - _draggablePaddle!.size.x / 2));
    final clientGameState = ClientGameState(
      id: user!.id,
      paddlePosition: relativeX.toInt(),
      ballState: ball!.getBallState(size, user!),
      serverLoopCount: gameState.serverLoop,
    );
    webSocketRepository.sendClientGameState(clientGameState);
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
    final start =
        Start(id: user!.id, ballState: ball!.getBallState(size, user!));
    webSocketRepository.sendStart(start);
  }

  Future<void> _countdown() async {
    final countdownText = CountdownText(gameSize: size);
    await add(countdownText);
    for (var i = kCountdownDuration; i > 0; i--) {
      countdownText.updateCount(i);
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    countdownText.removeFromParent();
  }
}
