// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerResponseImpl<T> _$$ServerResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ServerResponseImpl<T>(
      type: $enumDecode(_$ServerResponseTypeEnumMap, json['type']),
      responseDetail: fromJsonT(json['responseDetail']),
    );

Map<String, dynamic> _$$ServerResponseImplToJson<T>(
  _$ServerResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'type': _$ServerResponseTypeEnumMap[instance.type]!,
      'responseDetail': toJsonT(instance.responseDetail),
    };

const _$ServerResponseTypeEnumMap = {
  ServerResponseType.handshake: 'handshake',
  ServerResponseType.gameState: 'gameState',
};
