import 'package:freezed_annotation/freezed_annotation.dart';

part 'ball_state.freezed.dart';
part 'ball_state.g.dart';

@freezed
class BallState with _$BallState {
  /// コンストラクタ
  const factory BallState({
    required double relativeX,
    required double relativeY,
    required double vx,
    required double vy,
  }) = _BallState;
  const BallState._();

  /// JSONからインスタンスを生成する
  factory BallState.fromJson(Map<String, dynamic> json) =>
      _$BallStateFromJson(json);
}
