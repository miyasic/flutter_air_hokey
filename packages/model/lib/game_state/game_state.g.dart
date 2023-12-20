// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStateImpl _$$GameStateImplFromJson(Map<String, dynamic> json) =>
    _$GameStateImpl(
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toList(),
      ballState: json['ballState'] == null
          ? null
          : BallState.fromJson(json['ballState'] as Map<String, dynamic>),
      clientStateMap: (json['clientStateMap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, ClientState.fromJson(e as Map<String, dynamic>)),
      ),
      serverLoop: json['serverLoop'] as int,
      isFixed: json['isFixed'] as bool? ?? false,
      isReset: json['isReset'] as bool? ?? false,
      isGoal: json['isGoal'] as bool? ?? false,
      isDisconnect: json['isDisconnect'] as bool? ?? false,
    );

Map<String, dynamic> _$$GameStateImplToJson(_$GameStateImpl instance) =>
    <String, dynamic>{
      'ids': instance.ids,
      'ballState': instance.ballState,
      'clientStateMap': instance.clientStateMap,
      'serverLoop': instance.serverLoop,
      'isFixed': instance.isFixed,
      'isReset': instance.isReset,
      'isGoal': instance.isGoal,
      'isDisconnect': instance.isDisconnect,
    };
