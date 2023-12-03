// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientGameStateImpl _$$ClientGameStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientGameStateImpl(
      id: json['id'] as String,
      paddlePosition: json['paddlePosition'] as int,
      ballState: BallState.fromJson(json['ballState'] as Map<String, dynamic>),
      serverLoopCount: json['serverLoopCount'] as int,
    );

Map<String, dynamic> _$$ClientGameStateImplToJson(
        _$ClientGameStateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paddlePosition': instance.paddlePosition,
      'ballState': instance.ballState,
      'serverLoopCount': instance.serverLoopCount,
    };
