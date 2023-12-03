// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      userRole: $enumDecode(_$UserRoleEnumMap, json['userRole']),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userRole': _$UserRoleEnumMap[instance.userRole]!,
    };

const _$UserRoleEnumMap = {
  UserRole.roomCreator: 'roomCreator',
  UserRole.challenger: 'challenger',
  UserRole.spectator: 'spectator',
};
