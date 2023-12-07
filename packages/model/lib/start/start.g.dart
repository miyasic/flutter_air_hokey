// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartImpl _$$StartImplFromJson(Map<String, dynamic> json) => _$StartImpl(
      id: json['id'] as String,
      ballState: BallState.fromJson(json['ballState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StartImplToJson(_$StartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ballState': instance.ballState,
    };
