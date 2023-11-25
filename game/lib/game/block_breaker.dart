import 'dart:convert';

import 'package:air_hokey/game/game_state/game_state.dart';
import 'package:air_hokey/game/handshake/handshake.dart';
import 'package:air_hokey/game/position_state/position_state.dart';
import 'package:air_hokey/game/request/client_request.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game/components/field.dart';
import 'package:game/components/paddle/draggable_paddle.dart';
import 'package:game/components/paddle/opponent_paddle.dart';
import 'package:game/repository/web_socket_repository.dart';
import 'package:game/state/user.dart';

import '../components/ball.dart';
import '../components/block.dart';
import '../constants/constants.dart';

final blockBreakerProvider = Provider((ref) => BlockBreaker());

class BlockBreaker extends FlameGame with HasCollisionDetection {
  final webSocketRepository = WebSocketRepository();
  User? user;
  @override
  Future<void>? onLoad() async {
    final fieldSize = Vector2(400, 600);
    final paddleSize = Vector2(kPaddleWidth, kPaddleHeight);
    final opponentPaddle = OpponentPaddle(
      paddleSize: paddleSize,
      fieldSize: fieldSize,
      gameSize: size,
    );
    startWebSocketConnection(opponentPaddle);
    await addAll([
      Field(
        gameSize: size,
        fieldSize: fieldSize,
      ),
      DraggablePaddle(
          draggingPaddle: draggingPaddle,
          paddleSize: paddleSize,
          fieldSize: fieldSize,
          gameSize: size),
      opponentPaddle,
    ]);
    await resetBall();
    // await resetBlocks();
  }

  void startWebSocketConnection(OpponentPaddle opponentPaddle) {
    final s = webSocketRepository.getChannel().map((event) {
      final json = jsonDecode(event);
      switch (json['type']) {
        case 'gameState':
          return GameState.fromJson(json['responseDetail']);
        case 'handshake':
          final handShake = Handshake.fromJson(json['responseDetail']);
          user = User(id: handShake.id, userRole: handShake.userRole);
          return handShake.gameState;
        default:
          throw Exception('Unknown response type');
      }
    });
    s.listen((gameState) {
      // ここでpositionを更新する
      if (user != null) {
        opponentPaddle.updatePosition(gameState, user!);
      }
    });
  }

  Future<void> resetBall() async {
    final ball = Ball();

    ball.position
      ..x = size.x / 2 - ball.size.x / 2
      ..y = size.y * kBallStartYRatio;

    await add(ball);
  }

  Future<void> resetBlocks() async {
    final sizeX = (size.x -
            kBlocksStartXPosition * 2 -
            kBlockPadding * (kBlocksRowCount - 1)) /
        kBlocksRowCount;

    final sizeY = (size.y * kBlocksHeightRatio -
            kBlocksStartYPosition -
            kBlockPadding * (kBlocksColumnCount - 1)) /
        kBlocksColumnCount;

    final blocks =
        List<Block>.generate(kBlocksColumnCount * kBlocksRowCount, (int index) {
      final block = Block(
        blockSize: Vector2(sizeX, sizeY),
      );

      final indexX = index % kBlocksRowCount;
      final indexY = index ~/ kBlocksRowCount;

      block.position
        ..x = kBlocksStartXPosition + indexX * (block.size.x + kBlockPadding)
        ..y = kBlocksStartYPosition + indexY * (block.size.y + kBlockPadding);

      return block;
    });

    await addAll(blocks);
  }

  void draggingPaddle(DragUpdateEvent event) {
    final paddle = children.whereType<DraggablePaddle>().first;

    paddle.position.x += event.delta.x;

    if (paddle.position.x < 0) {
      paddle.position.x = 0;
    }
    if (paddle.position.x > size.x - paddle.size.x) {
      paddle.position.x = size.x - paddle.size.x;
    }
    final relativeX =
        -1 * (paddle.position.x - (size.x / 2 - paddle.size.x / 2));
    if (user != null) {
      final id = user!.id!;
      final userRole = user!.userRole!;
      webSocketRepository.message(ClientRequest(
          type: ClientRequestType.position,
          requestDetail: PositionState(
              id: id, userRole: userRole, paddlePosition: relativeX.toInt())));
    }
  }
}
