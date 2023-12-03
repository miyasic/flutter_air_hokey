// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetImpl _$$ResetImplFromJson(Map<String, dynamic> json) => _$ResetImpl(
      id: json['id'] as String,
      userRole: $enumDecode(_$UserRoleEnumMap, json['userRole']),
    );

Map<String, dynamic> _$$ResetImplToJson(_$ResetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userRole': _$UserRoleEnumMap[instance.userRole]!,
    };

const _$UserRoleEnumMap = {
  UserRole.roomCreator: 'roomCreator',
  UserRole.challenger: 'challenger',
  UserRole.spectator: 'spectator',
};
