import 'dart:convert';

import 'package:air_hokey/game/game_state/game_state.dart';
import 'package:broadcast_bloc/broadcast_bloc.dart';
import 'package:uuid/v4.dart';

class GameCubit extends BroadcastCubit<GameState> {
  // Create an instance with an initial state of 0.
  GameCubit() : super(const GameState(ids: [], position: 0));

  @override
  Object toMessage(GameState state) {
    return jsonEncode(state.toJson());
  }

  void onNewAccess() {
    final uuid = const UuidV4().generate();
    final newState = state.copyWith(ids: [...state.ids, uuid]);
    emit(newState);
  }

  // Increment the current state.
  void increment() {
    emit(state.copyWith(position: state.position + 1));
  }

  // Decrement the current state.
  void decrement() => emit(state.copyWith(
        position: state.position - 1,
      ));
}
