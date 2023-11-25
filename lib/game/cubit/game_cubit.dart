import 'dart:convert';

import 'package:air_hokey/game/game_state/game_state.dart';
import 'package:air_hokey/game/handshake/handshake.dart';
import 'package:air_hokey/game/position_state/position_state.dart';
import 'package:air_hokey/game/response/server_response.dart';
import 'package:broadcast_bloc/broadcast_bloc.dart';
import 'package:uuid/v4.dart';

class GameCubit extends BroadcastCubit<GameState> {
  // Create an instance with an initial state of 0.
  GameCubit() : super(const GameState(ids: [], positionMap: {}));

  @override
  Object toMessage(GameState state) {
    final serverResponse = ServerResponse(
      type: ServerResponseType.gameState,
      responseDetail: state,
    );
    return jsonEncode(serverResponse.toJson(
      (gameState) => gameState.toJson(),
    ));
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

  // Increment the current state.
  void update(PositionState positionState) {
    final newPositionMap = Map<String, int>.from(state.positionMap);
    newPositionMap[positionState.id] = positionState.paddlePosition;
    emit(state.copyWith(positionMap: newPositionMap));
  }
}
