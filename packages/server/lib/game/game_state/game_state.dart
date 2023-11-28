import 'package:air_hokey/game/ball_state/ball_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required List<String> ids,
    required Map<String, int> positionMap,
    BallState? ballState,
  }) = _GameState;
  const GameState._();

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);
}

extension GameStateX on GameState {
  String get debugViewText {
    if (ids.isEmpty) return "No player \n";
    if (ids.length == 1) return "player 1: ${positionMap[ids[0]]} \n";
    if (ids.length == 2) {
      return "player 1: ${positionMap[ids[0]]}\nplayer 2: ${positionMap[ids[1]]} \n";
    }
    return "player more than 2 \n";
  }
}
