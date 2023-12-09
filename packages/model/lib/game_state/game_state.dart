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
      return "player 1: ${clientStateMap[ids[0]]!.paddlePosition}\nplayer 2: ${clientStateMap[ids[0]]!.paddlePosition} \nPoint: ${clientStateMap[ids[0]]?.point} : ${clientStateMap[ids[1]]?.point} \n";
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

  // 既にもう片方がボールStateをリクエスト済みかどうか
  bool get isRequestedBallStateFromOtherClient {
    if (clientStateMap[ids[0]]!.declaredBallState != null) return true;
    if (clientStateMap[ids[1]]!.declaredBallState != null) return true;
    return false;
  }

  GameState get withoutDeclaredBallStates {
    final newClientStateMap = {
      roomCreatorId: clientStateMap[roomCreatorId]!.copyWith(
        declaredBallState: null,
      ),
      challengerId: clientStateMap[challengerId]!.copyWith(
        declaredBallState: null,
      ),
    };

    return copyWith(clientStateMap: newClientStateMap);
  }
}
