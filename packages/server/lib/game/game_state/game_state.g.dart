// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStateImpl _$$GameStateImplFromJson(Map<String, dynamic> json) =>
    _$GameStateImpl(
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toList(),
      positionMap: Map<String, int>.from(json['positionMap'] as Map),
      ballState: json['ballState'] == null
          ? null
          : BallState.fromJson(json['ballState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GameStateImplToJson(_$GameStateImpl instance) =>
    <String, dynamic>{
      'ids': instance.ids,
      'positionMap': instance.positionMap,
      'ballState': instance.ballState,
    };