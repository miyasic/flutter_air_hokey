import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/painting.dart';
import 'package:game/components/directional_hit_box.dart';
import 'package:game/constants/constants.dart';

class Wall extends RectangleComponent {
  Wall({
    required this.gameSize,
    required this.wallSize,
    required this.paint,
    required this.positionInput,
  }) : super(
          size: wallSize,
          // position: positionInput,
          position: Vector2(
              (gameSize.x - wallSize.x) / 2, (gameSize.y - wallSize.y) / 2),
          paint: paint,
        );
  final Vector2 gameSize;
  final Vector2 wallSize;
  final Paint paint;
  final Vector2 positionInput;

  @override
  FutureOr<void> onLoad() {
    // wall on the left side
    add(
      RectangleComponent(
        size: Vector2(wallThickness, size.y),
        position: Vector2(0, 0),
        paint: wallColor.paint(),
        children: [LeftHitbox(Vector2(10, size.y))],
      ),
    );

    // wall on the right side
    add(
      RectangleComponent(
        size: Vector2(wallThickness, size.y),
        position: Vector2(wallSize.x - wallThickness, 0),
        paint: wallColor.paint(),
        children: [RightHitbox(Vector2(1, size.y))],
      ),
    );

    // wall on the top
    add(
      RectangleComponent(
        size: Vector2(size.x, wallThickness),
        position: Vector2(0, 0),
        paint: wallColor.paint(),
        children: [BottomHitbox(Vector2(size.x, 1))],
      ),
    );

    // wall on the bottom
    add(
      RectangleComponent(
        size: Vector2(size.x, wallThickness),
        position: Vector2(0, wallSize.y),
        paint: wallColor.paint(),
        children: [UpperHitbox(Vector2(size.x, 1))],
      ),
    );
  }
}
