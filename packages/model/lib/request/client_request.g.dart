// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientRequestImpl<T> _$$ClientRequestImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ClientRequestImpl<T>(
      type: $enumDecode(_$ClientRequestTypeEnumMap, json['type']),
      requestDetail: fromJsonT(json['requestDetail']),
    );

Map<String, dynamic> _$$ClientRequestImplToJson<T>(
  _$ClientRequestImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'type': _$ClientRequestTypeEnumMap[instance.type]!,
      'requestDetail': toJsonT(instance.requestDetail),
    };

const _$ClientRequestTypeEnumMap = {
  ClientRequestType.clientDeclaration: 'clientDeclaration',
  ClientRequestType.reset: 'reset',
  ClientRequestType.start: 'start',
};
