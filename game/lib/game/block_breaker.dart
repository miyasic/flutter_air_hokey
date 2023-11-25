import 'package:air_hokey/game/handshake/handshake.dart';
import 'package:air_hokey/game/position_state/position_state.dart';
import 'package:air_hokey/game/request/client_request.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/palette.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game/components/field.dart';
import 'package:game/components/paddle/draggable_paddle.dart';
import 'package:game/components/paddle/opponent_paddle.dart';
import 'package:game/repository/web_socket_repository.dart';

import '../components/ball.dart';
import '../components/block.dart';
import '../components/paddle/paddle.dart';
import '../constants/constants.dart';

final blockBreakerProvider = Provider((ref) => BlockBreaker());

class BlockBreaker extends FlameGame with HasCollisionDetection {
  final websocketRepository = WebSocketRepository();
  @override
  Future<void>? onLoad() async {
    final fieldSize = Vector2(400, 600);
    final paddleSize = Vector2(kPaddleWidth, kPaddleHeight);
    await addAll([
      Field(
        gameSize: size,
        fieldSize: fieldSize,
        paint: BasicPalette.darkBlue.paint(),
      ),
      DraggablePaddle(
          draggingPaddle: draggingPaddle,
          paddleSize: paddleSize,
          fieldSize: fieldSize,
          gameSize: size),
      OpponentPaddle(
        paddleSize: paddleSize,
        fieldSize: fieldSize,
        gameSize: size,
      ),
    ]);
    await resetBall();
    // await resetBlocks();
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
    websocketRepository.message(ClientRequest(
        type: ClientRequestType.position,
        requestDetail: PositionState(
            id: '1', userRole: UserRole.challenger, paddlePosition: 10)));
  }
}
