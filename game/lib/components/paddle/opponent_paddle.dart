import 'package:flame/game.dart';
import 'package:game/components/paddle/paddle.dart';
import 'package:game/constants/constants.dart';

class OpponentPaddle extends Paddle {
  OpponentPaddle(
      {required super.fieldSize,
      required super.paddleSize,
      required super.gameSize})
      : super(
            position: Vector2((gameSize.x - paddleSize.x) / 2,
                (gameSize.y - fieldSize.y) / 2 + paddleSize.y + kPaddleStartY));

  @override
  void update(double dt) {
    position += Vector2(0, 0);
    super.update(dt);
  }
}
