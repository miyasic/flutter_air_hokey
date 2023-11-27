import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:game/constants/constants.dart';

class StartButton extends TextBoxComponent with TapCallbacks {
  StartButton({
    required this.onTap,
    required this.gameSize,
  }) : super(
          text: 'Start',
          size: Vector2(kButtonWidth, kButtonHeight),
          position: gameSize / 2,
          anchor: Anchor.center,
          align: Anchor.center,
        );

  final Future<void> Function() onTap;
  final Vector2 gameSize;

  @override
  bool onTapDown(TapDownEvent event) {
    // ボタンはタップされたら削除
    removeFromParent();
    onTap();
    return true;
  }

  @override
  void render(Canvas canvas) {
    final rect = Rect.fromLTWH(
      0,
      0,
      size.x,
      size.y,
    );
    final bgPaint = Paint()..color = kButtonColor;
    canvas.drawRect(rect, bgPaint);
    super.render(canvas);
  }
}
