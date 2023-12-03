import 'dart:convert';

import 'package:air_hokey_server/game/ball_state/ball_state.dart';
import 'package:air_hokey_server/game/game_state/game_state.dart';
import 'package:air_hokey_server/game/handshake/handshake.dart';
import 'package:air_hokey_server/game/reset/reset.dart';
import 'package:air_hokey_server/game/response/server_response.dart';
import 'package:air_hokey_server/game/start/start.dart';
import 'package:broadcast_bloc/broadcast_bloc.dart';

import '../client_game_state/client_game_state.dart';

class GameCubit extends BroadcastCubit<GameState> {
  // Create an instance with an initial state of 0.
  GameCubit()
      : super(const GameState(
            ids: [], positionMap: {}, serverLoop: 0, ballStateMap: {}));

  @override
  Object toMessage(GameState state) {
    final serverResponse = ServerResponse(
      type: ServerResponseType.gameState,
      responseDetail: state,
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
    if (state.ids.length >= 2) {
      return UserRole.spectator;
    }
    final newState = state.copyWith(
      ids: [...state.ids, uuid],
      positionMap: {
        ...state.positionMap,
        uuid: 0,
      },
    );
    emit(newState);
    return switch (state.ids.length) {
      1 => UserRole.roomCreator,
      2 => UserRole.challenger,
      _ => UserRole.spectator,
    };
  }

  Future<void> updateState(ClientGameState clientGameState) async {
    // print("10秒待ってね");
    // await Future.delayed(Duration(seconds: 3));
    if (state.ballStateMap.keys.contains(clientGameState.id)) {
      return;
    }
    final newPositionMap = Map<String, int>.from(state.positionMap);
    newPositionMap[clientGameState.id] = clientGameState.paddlePosition;
    if (state.ballStateMap.isEmpty) {
      // ボールの情報を追加する。
      final newBallStateMap = Map<String, BallState>.from(state.ballStateMap);
      newBallStateMap[clientGameState.id] = clientGameState.ballState;
      emit(state.copyWith(
          positionMap: newPositionMap,
          ballStateMap: newBallStateMap,
          isFixed: false));
      return;
    }
    final newServerLoop = state.serverLoop + 1;
    final aBallState = state.ballStateMap.values.first;
    final bBallState = clientGameState.ballState;
    if (aBallState == bBallState) {
      emit(state.copyWith(
          positionMap: newPositionMap,
          ballState: aBallState,
          ballStateMap: {},
          serverLoop: newServerLoop,
          isFixed: false));
      return;
    }

    // ボールの状態が違う場合、中心に近いボールを採用する。
    final newBallState = aBallState.relativeY.abs() < bBallState.relativeY.abs()
        ? aBallState
        : bBallState;

    emit(state.copyWith(
        positionMap: newPositionMap,
        ballState: newBallState,
        ballStateMap: {},
        serverLoop: newServerLoop,
        isFixed: true));
  }

  void reset(Reset reset) {
    // ゲームオーナーからのリセットの場合は、オーナーを保持
    if (reset.id == state.ids[0]) {
      emit(GameState(
          ids: [reset.id],
          positionMap: {reset.id: 0},
          ballState: null,
          ballStateMap: {},
          serverLoop: 0));
      return;
    }
    // それ以外の場合は完全にリセット
    emit(const GameState(
        ids: [],
        positionMap: {},
        ballState: null,
        ballStateMap: {},
        serverLoop: 0));
  }

  void start(Start start) {
    if (state.ballState != null) return; // 既にゲームが始まっている場合は何もしない
    emit(state.copyWith(ballState: start.ballState));
  }
}
