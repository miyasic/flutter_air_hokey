import 'package:air_hokey_server/game/client_game_state/client_game_state.dart';
import 'package:air_hokey_server/game/game_state/game_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state_with_client_queue.freezed.dart';
part 'game_state_with_client_queue.g.dart';

@freezed
class GameStateWithClientQueue with _$GameStateWithClientQueue {
  const factory GameStateWithClientQueue({
    required GameState gameState,
    required Map<String, List<ClientGameState>> clientGameStateQueue,
  }) = _GameStateWithClientQueue;
  const GameStateWithClientQueue._();

  factory GameStateWithClientQueue.fromJson(Map<String, dynamic> json) =>
      _$GameStateWithClientQueueFromJson(json);

  factory GameStateWithClientQueue.initial() => const GameStateWithClientQueue(
        clientGameStateQueue: {},
        gameState: GameState(ids: [], positionMap: {}, ballState: null),
      );
}
