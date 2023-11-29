import 'dart:math';
import 'dart:ui';
import 'package:air_hokey_server/game/ball_state/ball_state.dart';
import 'package:air_hokey_server/game/handshake/handshake.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:air_hokey_client/components/directional_hit_box.dart';
import 'package:air_hokey_client/components/paddle/paddle.dart';
import 'package:air_hokey_client/state/user.dart';

import '../../constants/constants.dart';

class Ball extends CircleComponent with CollisionCallbacks {
  Ball(Vector2 gameSize) {
    radius = kBallRadius;
    paint = Paint()..color = kBallColor;
    position = Vector2((gameSize.x - size.x) / 2, gameSize.y / 2);
    anchor = Anchor.center;

    final vx = kBallSpeed * cos(spawnAngle * kRad);
    final vy = kBallSpeed * sin(spawnAngle * kRad);
    velocity = Vector2(vx, vy);
  }
  late Vector2 velocity;

  bool isCollidedScreenHitboxX = false;
  bool isCollidedScreenHitboxY = false;

  double get spawnAngle {
    final random = Random().nextDouble();
    final spawnAngle =
        lerpDouble(kBallMinSpawnAngle, kBallMaxSpawnAngle, random)!;
    return spawnAngle;
  }

  @override
  void update(double dt) {
    position += velocity * minFlameTime;
    super.update(dt);
  }

  @override
  Future<void> onLoad() async {
    final hitbox = CircleHitbox(radius: radius);

    await add(hitbox);

    return super.onLoad();
  }

  void reload(BallState? ballState, User? user, Vector2 gameSize) {
    if (ballState == null) return; // 基本的にnullで入ってくることはない
    if (user == null) return; // 基本的にnullで入ってくることはない
    switch (user.userRole!) {
      case UserRole.roomCreator:
        x = ballState.relativeX + gameSize.x / 2;
        y = ballState.relativeY + gameSize.y / 2;
        velocity.x = ballState.vx;
        velocity.y = ballState.vy;
      case UserRole.challenger:
        x = -1 * ballState.relativeX + gameSize.x / 2;
        y = -1 * ballState.relativeY + gameSize.y / 2;
        velocity.x = ballState.vx;
        velocity.y = ballState.vy;
        velocity *= -1;
      case UserRole.spectator:
      // todo: 観戦者用の処理を実装
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    final collisionPoint = intersectionPoints.first;

    if (other is Paddle) {
      final paddleRect = other.toAbsoluteRect();

      updateBallTrajectory(collisionPoint, paddleRect);
    }

    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is DirectionalHitbox) {
      switch (other) {
        case LeftHitbox() || RightHitbox():
          if (!isCollidedScreenHitboxX) {
            velocity.x = -velocity.x;
            isCollidedScreenHitboxX = true;
          }
          break;
        case UpperHitbox() || BottomHitbox():
          if (!isCollidedScreenHitboxY) {
            velocity.y = -velocity.y;
            isCollidedScreenHitboxY = true;
          }
          break;
      }
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    isCollidedScreenHitboxX = false;
    isCollidedScreenHitboxY = false;
    super.onCollisionEnd(other);
  }

  void updateBallTrajectory(
    Vector2 collisionPoint,
    Rect rect,
  ) {
    final isLeftHit = collisionPoint.x == rect.left;
    final isRightHit = collisionPoint.x == rect.right;
    final isTopHit = collisionPoint.y == rect.top;
    final isBottomHit = collisionPoint.y == rect.bottom;

    final isLeftOrRightHit = isLeftHit || isRightHit;
    final isTopOrBottomHit = isTopHit || isBottomHit;

    if (isLeftOrRightHit) {
      velocity.x = -velocity.x;
      return;
    }

    if (isTopOrBottomHit) {
      velocity.y = -velocity.y;
      return;
    }
  }
}

extension BallX on Ball {
  Vector2 relativePosition(Vector2 gameSize) {
    return position - gameSize / 2;
  }

  String getDebugViewText(Vector2 gameSize) =>
      "Ball Position: ${relativePosition(gameSize).x.toInt()}, ${relativePosition(gameSize).y.toInt()} \n"
      "Ball Velocity: ${velocity.x.toInt()}, ${velocity.y.toInt()}\n";

  BallState getBallState(Vector2 gameSize) {
    final relativePosition = this.relativePosition(gameSize);
    return BallState(
        relativeX: relativePosition.x,
        relativeY: relativePosition.y,
        vx: velocity.x,
        vy: velocity.y);
  }
}