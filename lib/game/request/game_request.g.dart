// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameRequestImpl _$$GameRequestImplFromJson(Map<String, dynamic> json) =>
    _$GameRequestImpl(
      id: json['id'] as String,
      userRole: $enumDecode(_$UserRoleEnumMap, json['userRole']),
      paddlePosition: json['paddlePosition'] as int,
    );

Map<String, dynamic> _$$GameRequestImplToJson(_$GameRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userRole': _$UserRoleEnumMap[instance.userRole]!,
      'paddlePosition': instance.paddlePosition,
    };

const _$UserRoleEnumMap = {
  UserRole.roomCreator: 'roomCreator',
  UserRole.challenger: 'challenger',
  UserRole.spectator: 'spectator',
};
