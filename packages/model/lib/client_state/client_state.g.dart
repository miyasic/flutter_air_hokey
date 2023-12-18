// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientStateImpl _$$ClientStateImplFromJson(Map<String, dynamic> json) =>
    _$ClientStateImpl(
      id: json['id'] as String,
      paddlePosition: json['paddlePosition'] as int,
      point: json['point'] as int,
      declaredBallState: json['declaredBallState'] == null
          ? null
          : BallState.fromJson(
              json['declaredBallState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClientStateImplToJson(_$ClientStateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paddlePosition': instance.paddlePosition,
      'point': instance.point,
      'declaredBallState': instance.declaredBallState,
    };
