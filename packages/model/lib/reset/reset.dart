import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/handshake/handshake.dart';

part 'reset.freezed.dart';
part 'reset.g.dart';

@freezed
class Reset with _$Reset {
  /// コンストラクタ
  const factory Reset({
    /// ユーザーのID
    required String id,

    /// ユーザーのタイプ
    required UserRole userRole,
  }) = _Reset;
  const Reset._();

  /// JSONからインスタンスを生成する
  factory Reset.fromJson(Map<String, dynamic> json) => _$ResetFromJson(json);
}
