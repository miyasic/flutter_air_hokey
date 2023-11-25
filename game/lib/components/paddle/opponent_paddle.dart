import 'dart:convert';

import 'package:air_hokey/game/game_state/game_state.dart';
import 'package:air_hokey/game/handshake/handshake.dart';
import 'package:flame/game.dart';
import 'package:game/components/paddle/paddle.dart';
import 'package:game/constants/constants.dart';
import 'package:game/repository/web_socket_repository.dart';

class OpponentPaddle extends Paddle {
  OpponentPaddle(
      {required super.fieldSize,
      required super.paddleSize,
      required super.gameSize})
      : super(
            position: Vector2(
                (gameSize.x - paddleSize.x) / 2,
                (gameSize.y - fieldSize.y) / 2 +
                    paddleSize.y +
                    kPaddleStartY)) {
    final webSocketRepository = WebSocketRepository();
    positionStream = webSocketRepository.getChannel().map((event) {
      final json = jsonDecode(event);
      switch (json['type']) {
        case 'gameState':
          return GameState.fromJson(json['responseDetail']);
        case 'handshake':
          final handShake = Handshake.fromJson(json['responseDetail']);
          return handShake.gameState;
        default:
          throw Exception('Unknown response type');
      }
    });
    positionStream.listen((gameState) {
      position += Vector2(gameState.positionMap.values.first.toDouble(), 0);
    });
  }

  late final Stream<GameState> positionStream;

  @override
  void update(double dt) {
    position += Vector2(0, 0);
    super.update(dt);
  }
}
