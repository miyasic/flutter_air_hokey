import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:model/handshake/handshake.dart';

import '../../constants/constants.dart';

class Paddle extends RectangleComponent with CollisionCallbacks {
  Paddle(
      {required this.fieldSize,
      required this.paddleSize,
      required this.gameSize,
      super.position})
      : super(
          size: Vector2(kPaddleWidth, kPaddleHeight),
          paint: Paint()..color = kPaddleColor,
        );

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

  void updateColor(UserRole role) {
    final color = role.isSpectator ? kDisablePaddleColor : kPaddleColor;
    paint.color = color;
  }
}
