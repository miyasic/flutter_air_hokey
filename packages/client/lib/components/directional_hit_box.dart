import 'dart:async';

import 'package:air_hokey_client/constants/constants.dart';
import 'package:air_hokey_client/extension/vector2_extension.dart';
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

class UpperLeftHitbox extends DirectionalHitbox {
  UpperLeftHitbox({required Vector2 size, required Vector2 parentSize})
      : super(
          size: size.onlyXCalc((x) => x / 3),
          position: Vector2(0, 0),
        );
}

class UpperRightHitbox extends DirectionalHitbox {
  UpperRightHitbox({required Vector2 size, required Vector2 parentSize})
      : super(
          size: size.onlyXCalc((x) => x / 3),
          position: Vector2(size.x * 2 / 3, 0),
        );
}

class BottomLeftHitbox extends DirectionalHitbox {
  BottomLeftHitbox({required Vector2 size, required Vector2 parentSize})
      : super(
          size: size.onlyXCalc((x) => x / 3),
          position: Vector2(0, parentSize.y - size.y),
        );
}

class BottomRightHitbox extends DirectionalHitbox {
  BottomRightHitbox({required Vector2 size, required Vector2 parentSize})
      : super(
          size: size.onlyXCalc((x) => x / 3),
          position: Vector2(size.x * 2 / 3, parentSize.y - size.y),
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
