import 'package:flame/components.dart';

class DebugText extends TextComponent {
  DebugText()
      : super(
            position: Vector2(8, 8),
            anchor: Anchor.topLeft,
            scale: Vector2(0.7, 0.7));

  void updateText(List<String?> texts) {
    text = '';
    for (var nullableText in texts) {
      text += nullableText ?? '';
    }
  }
}
