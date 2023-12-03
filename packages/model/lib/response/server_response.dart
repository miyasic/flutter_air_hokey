import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_response.freezed.dart';
part 'server_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ServerResponse<T> with _$ServerResponse<T> {
  const factory ServerResponse({
    required ServerResponseType type,
    required T responseDetail,
  }) = _ServerResponse<T>;

  factory ServerResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ServerResponseFromJson(json, fromJsonT);
}

enum ServerResponseType {
  handshake,
  gameState,
}
