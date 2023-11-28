import 'package:air_hokey_server/game/ball_state/ball_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
