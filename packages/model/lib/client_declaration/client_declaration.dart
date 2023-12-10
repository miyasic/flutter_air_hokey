import 'package:freezed_annotation/freezed_annotation.dart';

import '../ball_state/ball_state.dart';

part 'client_declaration.freezed.dart';
part 'client_declaration.g.dart';

@freezed
class ClientDeclaration with _$ClientDeclaration {
  const ClientDeclaration._();
  const factory ClientDeclaration({
    required String id,
    required int paddlePosition,
    required BallState ballState,
    required int serverLoopCount,
  }) = _ClientDeclaration;

  factory ClientDeclaration.fromJson(Map<String, dynamic> json) =>
      _$ClientDeclarationFromJson(json);
}
