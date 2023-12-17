import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:air_hokey_client/constants/constants.dart';

class StartButton extends TextBoxComponent with TapCallbacks {
  StartButton({
    required this.gameSize,
  }) : super(
          text: 'Waiting ...',
          size: Vector2(kButtonWidth, kButtonHeight),
          position: gameSize / 2,
          anchor: Anchor.center,
          align: Anchor.center,
        );

  Future<void> Function()? onTap;
  final Vector2 gameSize;
  bool isEnabled = false;

  @override
  bool onTapDown(TapDownEvent event) {
    onTap!();
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
    final bgPaint = Paint()..color = isEnabled ? kButtonColor : kDisabledColor;
    canvas.drawRect(rect, bgPaint);
    super.render(canvas);
  }

  void setEnable({bool isEnabled = true}) {
    this.isEnabled = isEnabled;
    text = 'Start';
  }

  void setOnTap(Future<void> Function() onTap) {
    this.onTap = onTap;
  }
}
