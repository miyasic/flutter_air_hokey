import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/ball_state/ball_state.dart';

part 'start.freezed.dart';
part 'start.g.dart';

@freezed
class Start with _$Start {
  /// コンストラクタ
  const factory Start(
      {
      /// ユーザーのID
      required String id,
      required BallState ballState}) = _Start;
  const Start._();

  /// JSONからインスタンスを生成する
  factory Start.fromJson(Map<String, dynamic> json) => _$StartFromJson(json);
}
