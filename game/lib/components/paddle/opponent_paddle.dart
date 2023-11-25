import 'package:air_hokey/game/game_state/game_state.dart';
import 'package:flame/game.dart';
import 'package:game/components/paddle/paddle.dart';
import 'package:game/constants/constants.dart';
import 'package:game/state/user.dart';

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

  void updatePosition(
    GameState gameState,
    User user,
  ) {
    print(gameState.positionMap.values.first.toDouble());
    final x = gameState.positionMap[user.id!]?.toDouble();
    if (x == null) {
      return;
    }
    position = Vector2(x, position.y);
  }
}
