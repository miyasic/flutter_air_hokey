import 'package:air_hokey_client/components/ball.dart';
import 'package:air_hokey_client/components/button/start_button.dart';
import 'package:air_hokey_client/components/field.dart';
import 'package:air_hokey_client/components/paddle/draggable_paddle.dart';
import 'package:air_hokey_client/components/paddle/opponent_paddle.dart';
import 'package:air_hokey_client/constants/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/palette.dart';
import 'package:model/game_config/constants.dart';

class MyWorld extends World with HasCollisionDetection, DragCallbacks {
  MyWorld(this.gameSize);
  Vector2 gameSize;
  final fieldSize = Vector2(kFieldSizeX, kFieldSizeY);
  Field? field;
  final paddleSize = Vector2(kPaddleWidth, kPaddleHeight);
  OpponentPaddle? opponentPaddle;
  DraggablePaddle? draggablePaddle;
  StartButton? startButton;
  Ball? ball;
  @override
  Future<void> onLoad() async {
    field = Field(
      fieldSize: fieldSize,
      gameSize: gameSize,
      paint: BasicPalette.darkBlue.paint(),
    );
    opponentPaddle = OpponentPaddle(
      paddleSize: paddleSize,
      fieldSize: fieldSize,
      gameSize: gameSize,
    );
    draggablePaddle = DraggablePaddle(
        paddleSize: paddleSize, fieldSize: fieldSize, gameSize: gameSize);

    startButton = StartButton(
      gameSize: gameSize,
    );
    addAll([
      field!,
      opponentPaddle!,
      draggablePaddle!,
      startButton!,
    ]);
  }
}
