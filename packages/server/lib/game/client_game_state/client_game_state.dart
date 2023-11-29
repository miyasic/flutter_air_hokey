import 'package:air_hokey_server/game/ball_state/ball_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_game_state.freezed.dart';
part 'client_game_state.g.dart';

@freezed
class ClientGameState with _$ClientGameState {
  const ClientGameState._();
  const factory ClientGameState({
    required String id,
    required int position,
    required BallState ballState,
  }) = _ClientGameState;

  factory ClientGameState.fromJson(Map<String, dynamic> json) =>
      _$ClientGameStateFromJson(json);
}
