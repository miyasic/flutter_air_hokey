import 'package:air_hokey/game/handshake/handshake.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_request.freezed.dart';
part 'game_request.g.dart';

@freezed
class GameRequest with _$GameRequest {
  /// コンストラクタ
  const factory GameRequest({
    /// ユーザーのID
    required String id,

    /// ユーザーのタイプ
    required UserRole userRole,

    /// ゲームの状態
    required int paddlePosition,
  }) = _GameRequest;
  const GameRequest._();

  /// JSONからインスタンスを生成する
  factory GameRequest.fromJson(Map<String, dynamic> json) =>
      _$GameRequestFromJson(json);
}
