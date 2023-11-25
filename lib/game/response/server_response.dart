import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_response.freezed.dart';
part 'server_response.g.dart';

@freezed
class ServerResponse<T> with _$ServerResponse<T> {
  @JsonSerializable(genericArgumentFactories: true)
  const factory ServerResponse({
    required ServerResponseType type, // 'handshake' または 'gameState'
    required T responseDetail, // Handshake または GameState のインスタンス
  }) = _ServerResponse<T>;

  factory ServerResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerResponseFromJson(json);
}

enum ServerResponseType {
  handshake,
  gameState,
}
