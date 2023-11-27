import 'dart:convert';

import 'package:air_hokey/game/game_state/game_state.dart';
import 'package:air_hokey/game/handshake/handshake.dart';
import 'package:air_hokey/game/position_state/position_state.dart';
import 'package:air_hokey/game/reset/reset.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/components/button/start_button.dart';
import 'package:game/components/countdown_text.dart';
import 'package:game/components/debug_text.dart';
import 'package:game/components/field.dart';
import 'package:game/components/paddle/draggable_paddle.dart';
import 'package:game/components/paddle/opponent_paddle.dart';
import 'package:game/repository/web_socket_repository.dart';
import 'package:game/state/user.dart';

import '../components/ball.dart';
import '../constants/constants.dart';

class AirHokey extends FlameGame with HasCollisionDetection, KeyboardEvents {
  final webSocketRepository = WebSocketRepository();
  User? user;
  GameState? gameState;
  Ball? ball;

  final debugText = DebugText();
  @override
  Future<void>? onLoad() async {
    final fieldSize = Vector2(400, 600);
    final paddleSize = Vector2(kPaddleWidth, kPaddleHeight);
    final opponentPaddle = OpponentPaddle(
      paddleSize: paddleSize,
      fieldSize: fieldSize,
      gameSize: size,
    );
    ball = Ball(size);
    _startWebSocketConnection(opponentPaddle);
    await addAll([
      Field(
        gameSize: size,
        fieldSize: fieldSize,
        paint: BasicPalette.darkBlue.paint(),
      ),
      DraggablePaddle(
          draggingPaddle: _draggingPaddle,
          paddleSize: paddleSize,
          fieldSize: fieldSize,
          gameSize: size),
      opponentPaddle,
      if (isDebug) debugText,
    ]);
    await addStartButton();
  }

  @override
  void update(double dt) {
    super.update(dt);
    debugText.updateText([
      user?.debugViewText,
      gameState?.debugViewText,
      ball?.getDebugViewText(size)
    ]);
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
          id: user!.id!,
          userRole: user!.userRole!,
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
    s.listen((gameState) {
      // ここでpositionを更新する
      this.gameState = gameState;
      if (user != null) {
        opponentPaddle.updatePosition(gameState, user!);
      }
    });
  }

  void _draggingPaddle(DragUpdateEvent event) {
    final paddle = children.whereType<DraggablePaddle>().first;

    paddle.position.x += event.delta.x;

    if (paddle.position.x < 0) {
      paddle.position.x = 0;
    }
    if (paddle.position.x > size.x - paddle.size.x) {
      paddle.position.x = size.x - paddle.size.x;
    }
    final relativeX =
        -1 * (paddle.position.x - (size.x / 2 - paddle.size.x / 2));
    if (user != null) {
      final id = user!.id!;
      final userRole = user!.userRole!;
      webSocketRepository.sendPosition(
        PositionState(
          id: id,
          userRole: userRole,
          paddlePosition: relativeX.toInt(),
        ),
      );
    }
  }

  Future<void> addStartButton() async {
    final myTextButton = StartButton(
      onTapDownMyTextButton: onTapDownStartButton,
      renderMyTextButton: renderMyTextButton,
      gameSize: size,
    );

    await add(myTextButton);
  }

  Future<void> onTapDownStartButton() async {
    children.whereType<StartButton>().forEach((button) {
      button.removeFromParent();
    });
    await countdown();
    add(ball!);
  }

  void renderMyTextButton(Canvas canvas) {
    final myTextButton = children.whereType<StartButton>().first;
    final rect = Rect.fromLTWH(
      0,
      0,
      myTextButton.size.x,
      myTextButton.size.y,
    );
    final bgPaint = Paint()..color = kButtonColor;
    canvas.drawRect(rect, bgPaint);
  }

  Future<void> countdown() async {
    for (var i = kCountdownDuration; i > 0; i--) {
      final countdownText = CountdownText(count: i);

      countdownText.position
        ..x = size.x / 2 - countdownText.size.x / 2
        ..y = size.y / 2 - countdownText.size.y / 2;

      await add(countdownText);

      await Future<void>.delayed(const Duration(seconds: 1));
    }
  }
}
