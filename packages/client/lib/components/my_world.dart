import 'package:air_hokey_client/components/field.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:model/game_config/constants.dart';

class MyWorld extends World with HasCollisionDetection {
  MyWorld(this.gameSize);
  final Vector2 gameSize;
  final fieldSize = Vector2(kFieldSizeX, kFieldSizeY);
  @override
  Future<void> onLoad() async {
    print(gameSize);
    add(RectangleComponent(
        size: Vector2(10, 10),
        position: Vector2(0, 0),
        paint: BasicPalette.white.paint()));

    add(
      Field(
        gameSize: gameSize,
        fieldSize: fieldSize,
        paint: BasicPalette.darkBlue.paint(),
      ),
    );
  }
}
