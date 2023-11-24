import 'dart:convert';

import 'package:air_hokey/game/game_state/game_state.dart';
import 'package:broadcast_bloc/broadcast_bloc.dart';

class GameCubit extends BroadcastCubit<GameState> {
  // Create an instance with an initial state of 0.
  GameCubit() : super(const GameState(ids: [], position: 0));

  @override
  Object toMessage(GameState state) {
    return jsonEncode(state.toJson());
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
