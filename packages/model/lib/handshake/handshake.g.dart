// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handshake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HandshakeImpl _$$HandshakeImplFromJson(Map<String, dynamic> json) =>
    _$HandshakeImpl(
      id: json['id'] as String,
      userRole: $enumDecode(_$UserRoleEnumMap, json['userRole']),
      gameState: GameState.fromJson(json['gameState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HandshakeImplToJson(_$HandshakeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userRole': _$UserRoleEnumMap[instance.userRole]!,
      'gameState': instance.gameState,
    };

const _$UserRoleEnumMap = {
  UserRole.roomCreator: 'roomCreator',
  UserRole.challenger: 'challenger',
  UserRole.spectator: 'spectator',
};
