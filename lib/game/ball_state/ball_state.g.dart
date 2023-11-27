// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ball_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BallStateImpl _$$BallStateImplFromJson(Map<String, dynamic> json) =>
    _$BallStateImpl(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      vx: (json['vx'] as num).toDouble(),
      vy: (json['vy'] as num).toDouble(),
    );

Map<String, dynamic> _$$BallStateImplToJson(_$BallStateImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'vx': instance.vx,
      'vy': instance.vy,
    };
