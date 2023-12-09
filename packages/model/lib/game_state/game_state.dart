import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/ball_state/ball_state.dart';
import 'package:model/client_state/client_state.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required List<String> ids,
    BallState? ballState,
    required Map<String, BallState> ballStateMap,
    required Map<String, int> pointMap,
    required Map<String, ClientState> clientStateMap,
    required int serverLoop,
    @Default(false) bool isFixed,
    @Default(false) bool isReset,
    @Default(false) bool isGoal,
  }) = _GameState;
  const GameState._();

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);
}

extension GameStateX on GameState {
  String get debugViewText {
    if (ids.isEmpty) return "No player \n";
    if (ids.length == 1) {
      return "player 1: ${clientStateMap[ids[0]]!.paddlePosition} \n";
    }
    if (ids.length == 2) {
      return "player 1: ${clientStateMap[ids[0]]!.paddlePosition}\nplayer 2: ${clientStateMap[ids[0]]!.paddlePosition} \nPoint: ${pointMap[ids[0]]} : ${pointMap[ids[1]]} \n";
    }
    return "player more than 2 \n";
  }

  String get roomCreatorId {
    if (ids.isEmpty) throw Exception("No player");
    return ids[0];
  }

  String get challengerId {
    if (ids.length < 2) throw Exception("No challenger");
    return ids[1];
  }
}
