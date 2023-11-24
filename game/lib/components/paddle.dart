import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

import '../constants/constants.dart';

class Paddle extends RectangleComponent with DragCallbacks, CollisionCallbacks {
  Paddle(
      {required this.draggingPaddle,
      required this.fieldSize,
      required this.paddleSize,
      required this.gameSize})
      : super(
          size: Vector2(kPaddleWidth, kPaddleHeight),
          position: Vector2(
              (gameSize.x - paddleSize.x) / 2,
              (gameSize.y - fieldSize.y) / 2 +
                  fieldSize.y -
                  paddleSize.y -
                  kPaddleStartY),
          paint: Paint()..color = kPaddleColor,
        );

  final void Function(DragUpdateEvent event) draggingPaddle;
  final Vector2 paddleSize;
  final Vector2 gameSize;
  final Vector2 fieldSize;

  @override
  FutureOr<void> onLoad() {
    final paddleHitbox = RectangleHitbox(
      size: size,
    );

    add(paddleHitbox);

    return super.onLoad();
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    draggingPaddle(event);
    super.onDragUpdate(event);
  }
}
