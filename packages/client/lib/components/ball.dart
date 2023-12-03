import 'dart:math';
import 'dart:ui';
import 'package:air_hokey_client/extension/vector2_extension.dart';
import 'package:air_hokey_server/game/ball_state/ball_state.dart';
import 'package:air_hokey_server/game/handshake/handshake.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:air_hokey_client/components/directional_hit_box.dart';
import 'package:air_hokey_client/components/paddle/paddle.dart';
import 'package:air_hokey_client/state/user.dart';

import '../../constants/constants.dart';

class Ball extends CircleComponent with CollisionCallbacks {
  Ball(this.gameSize) {
    radius = kBallRadius;
    paint = Paint()..color = kBallColor;
    position = Vector2(gameSize.x / 2, gameSize.y / 2);
    anchor = Anchor.center;
    positionForRequest = position.clone();

    final vx = kBallSpeed * cos(spawnAngle * kRad);
    final vy = kBallSpeed * sin(spawnAngle * kRad);
    velocity = Vector2(vx, vy).roundToInteger();
    velocityForRequest = velocity.clone();
  }
  late Vector2 velocity;
  late final Vector2 gameSize;

  String collisionText = '';
  bool isCollidedScreenHitboxX = false;
  bool isCollidedScreenHitboxY = false;
  bool isCollidedPaddleHitbox = false;
  Vector2 positionForRequest = Vector2.zero();
  Vector2 velocityForRequest = Vector2.zero();

  double get spawnAngle {
    final random = Random().nextDouble();
    final spawnAngle =
        lerpDouble(kBallMinSpawnAngle, kBallMaxSpawnAngle, random)!;
    return spawnAngle;
  }

  @override
  Future<void> onLoad() async {
    final hitbox = CircleHitbox(radius: radius);

    await add(hitbox);

    return super.onLoad();
  }

  void calcPositionForRequest(User? user, Vector2 gameSize) {
    positionForRequest += (velocityForRequest * minFlameTime).roundToInteger();
  }

  void draw(BallState? ballState, User? user, Vector2 gameSize) {
    if (ballState == null) return; // 基本的にnullで入ってくることはない
    if (user == null) return; // 基本的にnullで入ってくることはない
    switch (user.userRole!) {
      case UserRole.roomCreator:
        x = ballState.relativeX + gameSize.x / 2;
        y = ballState.relativeY + gameSize.y / 2;
        positionForRequest = position.clone();
        velocity.x = ballState.vx;
        velocity.y = ballState.vy;
        velocityForRequest = velocity.clone();

      case UserRole.challenger:
        x = -1 * ballState.relativeX + gameSize.x / 2;
        y = -1 * ballState.relativeY + gameSize.y / 2;
        positionForRequest = position.clone();
        velocity.x = ballState.vx;
        velocity.y = ballState.vy;
        velocity *= -1;
        velocityForRequest = velocity.clone();
      case UserRole.spectator:
      // todo: 観戦者用の処理を実装
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    print("Collision");
    final collisionPoint = intersectionPoints.first;
    if (other is DirectionalHitbox) {
      switch (other) {
        case LeftHitbox() || RightHitbox():
          if (!isCollidedScreenHitboxX) {
            velocityForRequest.x = -velocityForRequest.x;
            velocity.x = -velocity.x;
            isCollidedScreenHitboxX = true;
          }
          break;
        case UpperHitbox() || BottomHitbox():
          if (!isCollidedScreenHitboxY) {
            velocityForRequest.y = -velocityForRequest.y;
            velocity.y = -velocity.y;
            isCollidedScreenHitboxY = true;
          }
          break;
      }
    }
    if (other is Paddle) {
      final paddleRect = other.toAbsoluteRect();
      updateBallTrajectory(collisionPoint, paddleRect, other);
      isCollidedPaddleHitbox = true;
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    isCollidedScreenHitboxX = false;
    isCollidedScreenHitboxY = false;
    isCollidedPaddleHitbox = false;
    super.onCollisionEnd(other);
  }

  void updateBallTrajectory(
    Vector2 collisionPoint,
    Rect rect,
    Paddle paddle,
  ) {
    final isLeftHit = collisionPoint.x == rect.left;
    final isRightHit = collisionPoint.x == rect.right;
    final isTopHit = collisionPoint.y == rect.top;
    final isBottomHit = collisionPoint.y == rect.bottom;

    String text = "Hit\n";
    if (isLeftHit) {
      if (velocityForRequest.x > 0) {
        velocityForRequest.x = -velocityForRequest.x;
        velocity.x = -velocity.x;
      }
      text += "Left ";
    }
    if (isRightHit) {
      if (velocityForRequest.x < 0) {
        velocityForRequest.x = -velocityForRequest.x;
        velocity.x = -velocity.x;
      }
      text += "Right ";
    }
    if (isTopHit) {
      if (velocityForRequest.y > 0) {
        velocityForRequest.y = -velocityForRequest.y;
        velocity.y = -velocity.y;
      }
      text += "Top ";
    }
    if (isBottomHit) {
      if (velocityForRequest.y < 0) {
        velocityForRequest.y = -velocityForRequest.y;
        velocity.y = -velocity.y;
      }
      text += "Bottom ";
    }
    text +=
        "x ${relativePositionForRequest(gameSize).x}, y ${relativePositionForRequest(gameSize).y} \n $collisionPoint";
    collisionText = text;
  }
}

extension BallX on Ball {
  Vector2 relativePositionForRequest(Vector2 gameSize) {
    return positionForRequest - gameSize / 2;
  }

  String getDebugViewText(Vector2 gameSize) =>
      "Ball Position: ${relativePositionForRequest(gameSize).x}, ${relativePositionForRequest(gameSize).y} \n"
      "Ball Velocity: ${velocity.x}, ${velocity.y}\n"
      "Collision: $collisionText\n";

  BallState getBallState(Vector2 gameSize, User user) {
    final relativePosition = relativePositionForRequest(gameSize);
    switch (user.userRole) {
      case UserRole.roomCreator:
        return BallState(
            relativeX: relativePosition.x,
            relativeY: relativePosition.y,
            vx: velocity.x,
            vy: velocity.y);
      case UserRole.challenger:
        return BallState(
            relativeX: -1 * relativePosition.x,
            relativeY: -1 * relativePosition.y,
            vx: -1 * velocity.x,
            vy: -1 * velocity.y);
      case UserRole.spectator:
        return BallState(
            relativeX: relativePosition.x,
            relativeY: relativePosition.y,
            vx: velocity.x,
            vy: velocity.y);
    }
  }
}
