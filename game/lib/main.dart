import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/game/block_breaker.dart';

void main() {
  final game = BlockBreaker();
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
