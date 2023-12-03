import 'package:air_hokey_server/game/handshake/handshake.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  /// コンストラクタ
  const factory User({
    /// ユーザーのID
    required String id,

    /// ユーザーのタイプ
    required UserRole userRole,
  }) = _User;
  const User._();

  /// JSONからインスタンスを生成する
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserX on User {
  /// ユーザーのタイプを取得する
  String get debugViewText {
    return "id: $id, \nuserRole: $userRole \n";
  }
}
