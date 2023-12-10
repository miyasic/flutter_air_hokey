import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/ball_state/ball_state.dart';
import 'package:model/client_declaration/client_declaration.dart';

part 'client_state.freezed.dart';
part 'client_state.g.dart';

@freezed
class ClientState with _$ClientState {
  const factory ClientState({
    required String id,
    required int paddlePosition,
    required int point,
    BallState? declaredBallState,
  }) = _ClientState;
  const ClientState._();

  factory ClientState.fromJson(Map<String, dynamic> json) =>
      _$ClientStateFromJson(json);
}

extension ClientStateX on ClientState {
  ClientState copyWithClientDeclaration(ClientDeclaration clientDeclaration) {
    return copyWith(
      paddlePosition: clientDeclaration.paddlePosition,
      declaredBallState: clientDeclaration.ballState,
    );
  }
}
