import 'dart:async';

import 'package:air_hokey_client/constants/constants.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

sealed class DirectionalHitbox extends RectangleComponent
    with CollisionCallbacks {
  DirectionalHitbox({super.size, super.position})
      : super(
          paint: wallColor.paint(),
        );

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
  UpperHitbox({required Vector2 size, required Vector2 parentSize})
      : super(
          size: size,
          position: Vector2(0, 0),
        );
}

class BottomHitbox extends DirectionalHitbox {
  BottomHitbox({required Vector2 size, required Vector2 parentSize})
      : super(
          size: size,
          position: Vector2(0, parentSize.y - size.y),
        );
}

class LeftHitbox extends DirectionalHitbox {
  LeftHitbox({required Vector2 size, required Vector2 parentSize})
      : super(
          size: size,
          position: Vector2(0, 0),
        );
}

class RightHitbox extends DirectionalHitbox {
  RightHitbox({required Vector2 size, required Vector2 parentSize})
      : super(
          size: size,
          position: Vector2(parentSize.x - size.x, 0),
        );
}
