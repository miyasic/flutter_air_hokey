// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PositionStateImpl _$$PositionStateImplFromJson(Map<String, dynamic> json) =>
    _$PositionStateImpl(
      id: json['id'] as String,
      userRole: $enumDecode(_$UserRoleEnumMap, json['userRole']),
      paddlePosition: json['paddlePosition'] as int,
    );

Map<String, dynamic> _$$PositionStateImplToJson(_$PositionStateImpl instance) =>
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
