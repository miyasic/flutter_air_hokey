import 'package:air_hokey_client/game/air_hokey.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HokeyPage extends StatelessWidget {
  const HokeyPage({@PathParam('id') required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context) {
    const bool isDebug = String.fromEnvironment('isDebug') == 'true';
    final game = AirHokey(isDebug: isDebug);
    return SafeArea(
      child: GameWidget(
        game: game,
      ),
    );
  }
}
