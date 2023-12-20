import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:air_hokey_client/components/paddle/paddle.dart';
import 'package:air_hokey_client/constants/constants.dart';

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
}
