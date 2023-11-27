import 'dart:ui';

import 'package:flame/components.dart';
import 'package:game/constants/constants.dart';

class CountdownText extends TextComponent {
  CountdownText({required this.gameSize})
      : super(
          size: Vector2.all(kCountdownSize),
          textRenderer: TextPaint(
            style: kCountdownTextStyle,
          ),
          position: gameSize / 2,
          anchor: Anchor.center,
        );
  final Vector2 gameSize;

  @override
  Future<void> render(Canvas canvas) async {
    super.render(canvas);
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  void updateCount(int count) {
    text = '$count';
  }
}
