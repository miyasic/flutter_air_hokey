import 'package:air_hokey_client/components/field.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:model/game_config/constants.dart';

class MyWorld extends World with HasCollisionDetection {
  MyWorld(this.gameSize);
  Vector2 gameSize;
  final fieldSize = Vector2(kFieldSizeX, kFieldSizeY);
  Field? field;
  @override
  Future<void> onLoad() async {
    add(RectangleComponent(
        size: Vector2(10, 10),
        position: Vector2(0, 0),
        paint: BasicPalette.white.paint()));

    field = Field(
      fieldSize: fieldSize,
      gameSize: gameSize,
      paint: BasicPalette.darkBlue.paint(),
    );
    add(
      field!,
    );
  }
}
