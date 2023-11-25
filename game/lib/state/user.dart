import 'package:air_hokey/game/handshake/handshake.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  /// コンストラクタ
  const factory User({
    /// ユーザーのID
    String? id,

    /// ユーザーのタイプ
    UserRole? userRole,
  }) = _User;
  const User._();

  /// JSONからインスタンスを生成する
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
