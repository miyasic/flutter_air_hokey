import 'package:flame/components.dart';

class DebugText extends TextComponent {
  DebugText()
      : super(
          position: Vector2(0, 0),
          anchor: Anchor.topLeft,
        );

  void updateText(List<String?> texts) {
    text = '';
    for (var nullableText in texts) {
      text += nullableText ?? '';
    }
  }
}
