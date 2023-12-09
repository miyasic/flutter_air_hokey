import 'dart:convert';

import 'package:model/client_declaration/client_declaration.dart';
import 'package:model/client_state/client_state.dart';
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
          serverLoop: 0,
          ballStateMap: {},
          pointMap: {},
          clientStateMap: {},
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
      clientStateMap: {
        ...state.clientStateMap,
        uuid: ClientState(
          id: uuid,
          paddlePosition: 0,
          point: 0,
          declaredBallState:
              const BallState(relativeX: 0, relativeY: 0, vx: 0, vy: 0),
        ),
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

  void updateState(ClientDeclaration clientDeclaration) {
    if (state.ballStateMap.keys.contains(clientDeclaration.id)) {
      return;
    }
    final newClientStateMap =
        Map<String, ClientState>.from(state.clientStateMap);
    newClientStateMap[clientDeclaration.id] =
        newClientStateMap[clientDeclaration.id]!
            .copyWithClientDeclaration(clientDeclaration);
    if (state.ballStateMap.isEmpty) {
      // ボールの情報を追加する。
      final newBallStateMap = Map<String, BallState>.from(state.ballStateMap);
      newBallStateMap[clientDeclaration.id] = clientDeclaration.ballState;
      emit(state.copyWith(
          clientStateMap: newClientStateMap,
          ballStateMap: newBallStateMap,
          isFixed: false));
      return;
    }
    final newServerLoop = state.serverLoop + 1;
    final aBallState = state.ballStateMap.values.first;
    final bBallState = clientDeclaration.ballState;
    if (aBallState == bBallState) {
      final newBallState = aBallState;
      if (_checkGoal(newBallState)) return;
      emit(state.copyWith(
          clientStateMap: newClientStateMap,
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
        clientStateMap: newClientStateMap,
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
      final newClientStateMap =
          Map<String, ClientState>.from(state.clientStateMap);
      newClientStateMap[state.roomCreatorId] =
          newClientStateMap[state.roomCreatorId]!.copyWith(
              declaredBallState: null,
              point: newClientStateMap[state.roomCreatorId]!.point + 1);
      newClientStateMap[state.challengerId] =
          newClientStateMap[state.challengerId]!.copyWith(
        declaredBallState: null,
      );
      emit(state.copyWith(
        ballState: null,
        clientStateMap: newClientStateMap,
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
      final newClientStateMap =
          Map<String, ClientState>.from(state.clientStateMap);
      newClientStateMap[state.challengerId] =
          newClientStateMap[state.challengerId]!.copyWith(
              declaredBallState: null,
              point: newClientStateMap[state.challengerId]!.point + 1);
      newClientStateMap[state.roomCreatorId] =
          newClientStateMap[state.roomCreatorId]!.copyWith(
        declaredBallState: null,
      );
      emit(state.copyWith(
        ballState: null,
        clientStateMap: newClientStateMap,
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
        ballState: null,
        ballStateMap: {},
        clientStateMap: {},
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
