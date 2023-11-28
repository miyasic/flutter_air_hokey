import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/game/air_hokey.dart';
import 'package:game/overlay.dart';

void main() {
  final game = AirHokey();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Stack(
          children: [
            GameWidget(
              game: game,
            ),
            const OverlayWidget(),
          ],
        ),
      ),
    ),
  );
}
