import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/painting.dart';
import 'package:air_hokey_client/components/directional_hit_box.dart';
import 'package:air_hokey_client/constants/constants.dart';

class Field extends RectangleComponent {
  Field({
    required this.gameSize,
    required this.fieldSize,
    required this.paint,
  }) : super(
          size: fieldSize,
          position: Vector2(
              (gameSize.x - fieldSize.x) / 2, (gameSize.y - fieldSize.y) / 2),
          paint: paint,
        );
  final Vector2 gameSize;
  final Vector2 fieldSize;
  @override
  final Paint paint;

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
        position: Vector2(fieldSize.x - wallThickness, 0),
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
        position: Vector2(0, fieldSize.y),
        paint: wallColor.paint(),
        children: [UpperHitbox(Vector2(size.x, 1))],
      ),
    );
  }
}
