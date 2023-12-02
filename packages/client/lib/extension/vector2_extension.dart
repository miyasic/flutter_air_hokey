import 'package:flame/game.dart';

extension Vector2X on Vector2 {
  Vector2 roundToInteger() {
    return Vector2(x.roundToDouble(), y.roundToDouble());
  }
}
