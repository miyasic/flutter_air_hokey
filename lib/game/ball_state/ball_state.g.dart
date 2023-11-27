// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ball_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BallStateImpl _$$BallStateImplFromJson(Map<String, dynamic> json) =>
    _$BallStateImpl(
      relativeX: (json['relativeX'] as num).toDouble(),
      relativeY: (json['relativeY'] as num).toDouble(),
      vx: (json['vx'] as num).toDouble(),
      vy: (json['vy'] as num).toDouble(),
    );

Map<String, dynamic> _$$BallStateImplToJson(_$BallStateImpl instance) =>
    <String, dynamic>{
      'relativeX': instance.relativeX,
      'relativeY': instance.relativeY,
      'vx': instance.vx,
      'vy': instance.vy,
    };
