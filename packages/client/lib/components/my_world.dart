import 'package:air_hokey_client/components/field.dart';
import 'package:air_hokey_client/components/paddle/opponent_paddle.dart';
import 'package:air_hokey_client/constants/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:model/game_config/constants.dart';

class MyWorld extends World with HasCollisionDetection {
  MyWorld(this.gameSize);
  Vector2 gameSize;
  final fieldSize = Vector2(kFieldSizeX, kFieldSizeY);
  Field? field;
  final paddleSize = Vector2(kPaddleWidth, kPaddleHeight);
  OpponentPaddle? opponentPaddle;
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
    addAll([
      field!,
      opponentPaddle!,
    ]);
  }
}
