import 'dart:convert';

import 'package:model/client_game_state/client_game_state.dart';
import 'package:model/game_config/constants.dart';
import 'package:model/game_state/game_state.dart';
import 'package:model/ball_state/ball_state.dart';
import 'package:model/handshake/handshake.dart';
import 'package:model/reset/reset.dart';
import 'package:model/response/server_response.dart';
import 'package:model/start/start.dart';
import 'package:broadcast_bloc/broadcast_bloc.dart';

class GameCubit extends BroadcastCubit<GameState> {
  // Create an instance with an initial state of 0.
  GameCubit()
      : super(const GameState(
          ids: [],
          positionMap: {},
          serverLoop: 0,
          ballStateMap: {},
          pointMap: {},
          isGoal: false,
        ));

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
      pointMap: {
        ...state.pointMap,
        uuid: 0,
      },
      isReset: false,
    );
    emit(newState);
    return switch (state.ids.length) {
      1 => UserRole.roomCreator,
      2 => UserRole.challenger,
      _ => UserRole.spectator,
    };
  }

  void updateState(ClientGameState clientGameState) {
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
      final newBallState = aBallState;
      if (_checkGoal(newBallState)) return;
      emit(state.copyWith(
          positionMap: newPositionMap,
          ballState: newBallState,
          ballStateMap: {},
          serverLoop: newServerLoop,
          isFixed: false));
      return;
    }

    // ボールの状態が違う場合、中心に近いボールを採用する。
    final newBallState = aBallState.relativeY.abs() < bBallState.relativeY.abs()
        ? aBallState
        : bBallState;
    if (_checkGoal(newBallState)) return;
    emit(state.copyWith(
        positionMap: newPositionMap,
        ballState: newBallState,
        ballStateMap: {},
        serverLoop: newServerLoop,
        isFixed: true));
  }

  bool _checkGoal(BallState ballState) {
    // relativeYが正方向だとgameMasterのゴール
    if (ballState.relativeY < -kFieldSizeY / 2) {
      final newPointMap = Map<String, int>.from(state.pointMap);
      newPointMap[state.roomCreatorId] = (newPointMap[state.ids[0]] ?? 0) + 1;
      emit(state.copyWith(
        ballState: null,
        pointMap: newPointMap,
        ballStateMap: {},
        serverLoop: 0,
        isGoal: true,
      ));
      return true;
    }
    if (ballState.relativeY > kFieldSizeY / 2) {
      final newPointMap = Map<String, int>.from(state.pointMap);
      newPointMap[state.challengerId] = (newPointMap[state.ids[1]] ?? 0) + 1;
      emit(state.copyWith(
        ballState: null,
        pointMap: newPointMap,
        ballStateMap: {},
        serverLoop: 0,
        isGoal: true,
      ));
      return true;
    }
    return false;
  }

  void reset(Reset reset) {
    emit(const GameState(
        ids: [],
        positionMap: {},
        ballState: null,
        ballStateMap: {},
        serverLoop: 0,
        isFixed: false,
        isReset: true,
        isGoal: false,
        pointMap: {}));
  }

  void start(Start start) {
    if (state.ballState != null) return; // 既にゲームが始まっている場合は何もしない
    emit(state.copyWith(
      ballState: start.ballState,
      isGoal: false,
    ));
  }
}
