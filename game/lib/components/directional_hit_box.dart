import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class DirectionalHitbox extends RectangleComponent with CollisionCallbacks {
  DirectionalHitbox({super.size, super.position})
      : super(paint: BasicPalette.transparent.paint());

  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (parent is CollisionCallbacks) {
      (parent as CollisionCallbacks).onCollision(intersectionPoints, other);
    }
  }
}

class UpperHitbox extends DirectionalHitbox {
  UpperHitbox(Vector2 parentSize)
      : super(
          size: Vector2(parentSize.x, 1),
          position: Vector2(0, 0),
        );
}

class BottomHitbox extends DirectionalHitbox {
  BottomHitbox(Vector2 parentSize)
      : super(
          size: Vector2(parentSize.x, 1),
          position: Vector2(0, parentSize.y),
        );
}

class LeftHitbox extends DirectionalHitbox {
  LeftHitbox(Vector2 parentSize)
      : super(
          size: Vector2(1, parentSize.y),
          position: Vector2(0, 0),
        );
}

class RightHitbox extends DirectionalHitbox {
  RightHitbox(Vector2 parentSize)
      : super(
          size: Vector2(1, parentSize.y),
          position: Vector2(parentSize.x, 0),
        );
}
