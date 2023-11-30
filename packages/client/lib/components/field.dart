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
          anchor: Anchor.center,
          position: gameSize / 2,
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
      LeftHitbox(size: Vector2(wallThickness, size.y), parentSize: size),
    );

    // wall on the right side
    add(
      RightHitbox(size: Vector2(wallThickness, size.y), parentSize: size),
    );

    // wall on the top
    add(
      UpperHitbox(size: Vector2(size.x, wallThickness), parentSize: size),
    );

    // wall on the bottom
    add(
      BottomHitbox(size: Vector2(size.x, wallThickness), parentSize: size),
    );
  }
}
