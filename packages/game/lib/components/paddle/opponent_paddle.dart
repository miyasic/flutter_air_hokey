import 'package:air_hokey_server/game/game_state/game_state.dart';
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
    if (gameState.positionMap.keys.length < 2) {
      return;
    }
    // 対戦相手のIDを取得するため、positionMapからユーザー自身のIDを除外
    final opponentId = gameState.positionMap.keys.firstWhere(
      (id) => id != user.id,
    );
    final x = gameState.positionMap[opponentId]?.toDouble();
    if (x == null) {
      return;
    }
    final relativeX = x + gameSize.x / 2 - paddleSize.x / 2;
    position = Vector2(relativeX, position.y);
  }
}
