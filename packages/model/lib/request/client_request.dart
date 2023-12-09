import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_request.freezed.dart';
part 'client_request.g.dart';

@Freezed(genericArgumentFactories: true)
class ClientRequest<T> with _$ClientRequest<T> {
  /// コンストラクタ
  const factory ClientRequest({
    required ClientRequestType type,
    required T requestDetail,
  }) = _ClientRequest<T>;

  const ClientRequest._();

  /// JSONからインスタンスを生成する
  factory ClientRequest.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ClientRequestFromJson(json, fromJsonT);
}

enum ClientRequestType {
  clientGameState,
  reset,
  start;

  // 文字列から Enum への変換
  static ClientRequestType fromString(String type) {
    return ClientRequestType.values.firstWhere(
      (e) => e.name == type,
      orElse: () => throw ArgumentError('Unknown ClientRequestType: $type'),
    );
  }

  // Enum から文字列への変換（必要に応じて）
  String get name => toString().split('.').last;
}
