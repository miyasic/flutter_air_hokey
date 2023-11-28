import 'package:air_hokey_server/game/handshake/handshake.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'position_state.freezed.dart';
part 'position_state.g.dart';

@freezed
class PositionState with _$PositionState {
  /// コンストラクタ
  const factory PositionState({
    /// ユーザーのID
    required String id,

    /// ユーザーのタイプ
    required UserRole userRole,

    /// ゲームの状態
    required int paddlePosition,
  }) = _PositionState;
  const PositionState._();

  /// JSONからインスタンスを生成する
  factory PositionState.fromJson(Map<String, dynamic> json) =>
      _$PositionStateFromJson(json);
}
