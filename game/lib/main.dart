import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/game/block_breaker.dart';
import 'package:game/overlay.dart';

void main() {
  final game = BlockBreaker();
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
