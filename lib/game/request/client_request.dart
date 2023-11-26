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
  position,
  reset,
}
