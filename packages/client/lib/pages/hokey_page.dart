import 'package:air_hokey_client/components/my_world.dart';
import 'package:air_hokey_client/game/air_hokey.dart';
import 'package:air_hokey_client/provider/is_debug_proivder.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:model/game_config/constants.dart';

@RoutePage()
class HokeyPage extends ConsumerWidget {
  const HokeyPage({@PathParam('id') required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSize = MediaQuery.of(context).size;
    final bool isDebug = ref.watch(isDebugProvider);
    final world = MyWorld(Vector2(gameSize.width, gameSize.height));
    final camera = CameraComponent(
      world: world,
    );

    // final camera = CameraComponent.withFixedResolution(
    //   world: world,
    //   width: gameSize.width, // ゲーム空間の横幅
    //   height: gameSize.height, // ゲーム空間の高さ
    // );
    final game = AirHokey(
      world: world,
      isDebug: isDebug,
      id: id,
      camera: camera,
    );

    return SafeArea(
      child: GameWidget(
        game: game,
      ),
    );
  }
}
