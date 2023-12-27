import 'package:model/game_state/game_state.dart';
import 'package:flame/game.dart';
import 'package:air_hokey_client/components/paddle/paddle.dart';
import 'package:air_hokey_client/constants/constants.dart';
import 'package:air_hokey_client/state/user.dart';
import 'package:model/handshake/handshake.dart';

class OpponentPaddle extends Paddle {
  OpponentPaddle(
      {required super.fieldSize,
      required super.paddleSize,
      required super.gameSize})
      : super(
            position: Vector2((gameSize.x - paddleSize.x) / 2,
                (gameSize.y - fieldSize.y) / 2 + kPaddleStartY));

  @override
  void update(double dt) {
    position += Vector2(0, 0);
    super.update(dt);
  }

  void updatePosition(
    GameState gameState,
    User user,
  ) {
    if (gameState.clientStateMap.keys.length < 2) {
      return;
    }
    // 対戦相手のIDを取得するため、positionMapからユーザー自身のIDを除外
    final opponentId = user.userRole.isSpectator
        ? gameState.challengerId
        : gameState.getOpponentUserId(user.id);

    final x = gameState.clientStateMap[opponentId]?.paddlePosition.toDouble();
    if (x == null) {
      return;
    }
    final relativeX = x + gameSize.x / 2 - paddleSize.x / 2;
    position = Vector2(relativeX, position.y);
  }
}
