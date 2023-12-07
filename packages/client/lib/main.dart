import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:air_hokey_client/game/air_hokey.dart';

void main() {
  const bool isDebug = String.fromEnvironment('isDebug') == 'true';
  final game = AirHokey(isDebug: isDebug);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: GameWidget(
          game: game,
        ),
      ),
    ),
  );
}
