import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:air_hokey_client/game/air_hokey.dart';

void main() {
  final game = AirHokey();
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
