// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_declaration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientDeclarationImpl _$$ClientDeclarationImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientDeclarationImpl(
      id: json['id'] as String,
      paddlePosition: json['paddlePosition'] as int,
      ballState: BallState.fromJson(json['ballState'] as Map<String, dynamic>),
      serverLoopCount: json['serverLoopCount'] as int,
    );

Map<String, dynamic> _$$ClientDeclarationImplToJson(
        _$ClientDeclarationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paddlePosition': instance.paddlePosition,
      'ballState': instance.ballState,
      'serverLoopCount': instance.serverLoopCount,
    };
