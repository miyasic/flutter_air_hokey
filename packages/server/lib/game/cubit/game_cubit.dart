import 'dart:convert';

import 'package:air_hokey_server/game/ball_state/ball_state.dart';
import 'package:air_hokey_server/game/client_game_state/client_game_state.dart';
import 'package:air_hokey_server/game/game_state/game_state.dart';
import 'package:air_hokey_server/game/game_state_with_client_queue/game_state_with_client_queue.dart';
import 'package:air_hokey_server/game/handshake/handshake.dart';
import 'package:air_hokey_server/game/position_state/position_state.dart';
import 'package:air_hokey_server/game/reset/reset.dart';
import 'package:air_hokey_server/game/response/server_response.dart';
import 'package:air_hokey_server/game/start/start.dart';
import 'package:broadcast_bloc/broadcast_bloc.dart';

class GameCubit extends BroadcastCubit<GameStateWithClientQueue> {
  // Create an instance with an initial state of 0.
  GameCubit() : super(GameStateWithClientQueue.initial());

  @override
  Object toMessage(GameStateWithClientQueue state) {
    final serverResponse = ServerResponse(
      type: ServerResponseType.gameState,
      responseDetail: state.gameState,
    );
    return jsonEncode(
      serverResponse.toJson(
        (gameState) => gameState.toJson(),
      ),
    );
  }

  UserRole onNewAccess(String uuid) {
    // 最初の2人だけゲームに参加できる。
    // それ以降の人は観戦者として扱う。
    if (state.gameState.ids.length >= 2) {
      return UserRole.spectator;
    }
    final newState = state.copyWith(
      gameState: state.gameState.copyWith(
        ids: [...state.gameState.ids, uuid],
        positionMap: {
          ...state.gameState.positionMap,
          uuid: 0,
        },
      ),
    );
    emit(newState);
    return switch (state.gameState.ids.length) {
      1 => UserRole.roomCreator,
      2 => UserRole.challenger,
      _ => UserRole.spectator,
    };
  }

  // Increment the current state.
  void update(PositionState positionState) {
    final newPositionMap = Map<String, int>.from(state.gameState.positionMap);
    newPositionMap[positionState.id] = positionState.paddlePosition;
    emit(state.copyWith(
        gameState: state.gameState.copyWith(positionMap: newPositionMap)));
  }

  void updateGameState(ClientGameState clientGameState) {
    final newClientGameStateQueue =
        Map<String, List<ClientGameState>>.from(state.clientGameStateQueue);
    final newQueue = [
      ...newClientGameStateQueue[clientGameState
          .id]!, // Game開始時に追加しているため、nullではない。 計算を増やさないためにnullCheckをしない。
      clientGameState
    ];
    newClientGameStateQueue[clientGameState.id] = newQueue;
    if (newClientGameStateQueue.values.every((queue) => queue.isNotEmpty)) {
      // すべてのクライアントからデータが送られてきたら、ゲームの状態を更新する。
      final aClientGameQueue = newClientGameStateQueue.values.first;
      final aClientGameState = aClientGameQueue.first;
      aClientGameQueue.removeAt(0);
      final bClientGameQueue = newClientGameStateQueue.values.last;
      final bClientGameState = bClientGameQueue.first;
      bClientGameQueue.removeAt(0);
      final newPositionMap = {
        aClientGameState.id: aClientGameState.paddlePosition,
        bClientGameState.id: bClientGameState.paddlePosition,
      };
      final ballStateMap = {
        aClientGameState.id: aClientGameState.ballState,
        bClientGameState.id: bClientGameState.ballState,
      };
      final newGameState = state.gameState.copyWith(
        ballState: ballStateMap.nextBallState,
        positionMap: newPositionMap,
      );
      if (aClientGameQueue.first.serverLoopCount ==
          aClientGameState.serverLoopCount) {
        print("うまく先頭が削除できていません。");
      } else {
        print("うまく先頭が削除できています。");
      }
      if (bClientGameQueue.first.serverLoopCount ==
          bClientGameState.serverLoopCount) {
        print("うまく先頭が削除できていません。");
      } else {
        print("うまく先頭が削除できています。");
      }
      emit(state.copyWith(
        gameState: newGameState,
        clientGameStateQueue: {
          aClientGameState.id: aClientGameQueue,
          bClientGameState.id: bClientGameQueue,
        },
      ));
      return;
    }
    emit(state.copyWith(clientGameStateQueue: newClientGameStateQueue));
  }

  void reset(Reset reset) {
    emit(GameStateWithClientQueue.initial());
  }

  void start(Start start) {
    if (state.gameState.ballState != null) return; // 既にゲームが始まっている場合は何もしない
    emit(state.copyWith(
        gameState: state.gameState.copyWith(ballState: start.ballState)));
  }
}
