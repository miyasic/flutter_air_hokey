import 'dart:ui';

import 'package:air_hokey_client/state/user.dart';
import 'package:flame/components.dart';
import 'package:air_hokey_client/constants/constants.dart';
import 'package:model/game_state/game_state.dart';

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

  void pointText(GameState gameState, User user) {
    final myId = user.id;
    final opponentId = user.getOpponentUserId(gameState);
    text =
        "${gameState.clientStateMap[myId]?.point ?? 0} : ${gameState.clientStateMap[opponentId]?.point ?? 0}";
  }
}
