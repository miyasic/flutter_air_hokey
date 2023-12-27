import 'package:air_hokey_client/state/user.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:air_hokey_client/components/paddle/paddle.dart';
import 'package:air_hokey_client/constants/constants.dart';
import 'package:model/game_state/game_state.dart';
import 'package:model/handshake/handshake.dart';

class DraggablePaddle extends Paddle with DragCallbacks {
  DraggablePaddle(
      {required super.fieldSize,
      required super.paddleSize,
      required super.gameSize})
      : super(
            position: Vector2(
                (gameSize.x - paddleSize.x) / 2,
                (gameSize.y - fieldSize.y) / 2 +
                    fieldSize.y -
                    paddleSize.y -
                    kPaddleStartY));

  void Function(DragUpdateEvent event)? draggingPaddle;

  @override
  void onDragUpdate(DragUpdateEvent event) {
    final draggingPaddle = this.draggingPaddle;
    if (draggingPaddle != null) draggingPaddle(event);
    super.onDragUpdate(event);
  }

  addDraggingPaddle(void Function(DragUpdateEvent event) draggingPaddle) {
    this.draggingPaddle = draggingPaddle;
  }

  // 観戦者の場合のみ利用する。
  void updatePosition(GameState gameState, User user) {
    if (gameState.clientStateMap.keys.length < 2) {
      return;
    }
    // 観戦者の場合のみ利用するのでそれ以外の場合はreturn
    if (!user.userRole.isSpectator) {
      return;
    }

    final roomCreatorId = gameState.roomCreatorId;
    final x =
        gameState.clientStateMap[roomCreatorId]?.paddlePosition.toDouble();
    if (x == null) {
      return;
    }
    final relativeX = -x + gameSize.x / 2 - paddleSize.x / 2;
    position = Vector2(relativeX, position.y);
  }
}
