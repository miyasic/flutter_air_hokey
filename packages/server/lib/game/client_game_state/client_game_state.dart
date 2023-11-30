import 'package:freezed_annotation/freezed_annotation.dart';

import '../ball_state/ball_state.dart';

part 'client_game_state.freezed.dart';
part 'client_game_state.g.dart';

@freezed
class ClientGameState with _$ClientGameState {
  const ClientGameState._();
  const factory ClientGameState({
    required String id,
    required int paddlePosition,
    required BallState ballState,
    required int serverLoopCount,
  }) = _ClientGameState;

  factory ClientGameState.fromJson(Map<String, dynamic> json) =>
      _$ClientGameStateFromJson(json);
}
