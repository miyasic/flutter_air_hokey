import 'package:model/game_state/game_state.dart';
import 'package:model/handshake/handshake.dart';
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

  String getOpponentUserId(GameState gameState) {
    final ids = gameState.ids;
    return ids[0] == id ? ids[1] : ids[0];
  }
}
