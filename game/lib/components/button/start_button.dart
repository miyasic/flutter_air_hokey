import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:game/constants/constants.dart';

class StartButton extends TextBoxComponent with TapCallbacks {
  StartButton({
    required this.onTapDownMyTextButton,
    required this.renderMyTextButton,
    required this.gameSize,
  }) : super(
          text: 'Start',
          size: Vector2(kButtonWidth, kButtonHeight),
          position: gameSize / 2,
          anchor: Anchor.center,
          align: Anchor.center,
        );

  final Future<void> Function() onTapDownMyTextButton;
  final void Function(Canvas canvas) renderMyTextButton;
  final Vector2 gameSize;

  @override
  bool onTapDown(TapDownEvent event) {
    print('StartButton: onTapDown');
    onTapDownMyTextButton();
    return true;
  }

  @override
  void render(Canvas canvas) {
    renderMyTextButton(canvas);
    super.render(canvas);
  }
}
