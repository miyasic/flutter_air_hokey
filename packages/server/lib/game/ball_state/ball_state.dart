import 'dart:math';

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

extension BallStateX on Map<String, BallState> {
  /// ボールの位置、速度を決定する。
  BallState get nextBallState {
    final ballState1 = values.toList()[0];
    final ballState2 = values.toList()[1];
    final relativeX = (ballState1.relativeX + ballState2.relativeX) / 2;
    final relativeY = (ballState1.relativeY + ballState2.relativeY) / 2;
    final vx = getNextVelocityElement(ballState1.vx, ballState2.vx);
    final vy = getNextVelocityElement(ballState1.vy, ballState2.vy);
    return BallState(
      relativeX: relativeX,
      relativeY: relativeY,
      vx: vx,
      vy: vy,
    );
  }

  double getNextVelocityElement(v1, v2) {
    if (v1 * v2 < 0) {
      // どちらかをランダムに採用する。
      final random = Random();
      return random.nextBool() ? v1 : v2;
    } else {
      return (v1 + v2) / 2;
    }
  }
}
