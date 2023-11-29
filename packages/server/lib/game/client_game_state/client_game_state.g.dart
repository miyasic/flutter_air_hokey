// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientGameStateImpl _$$ClientGameStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientGameStateImpl(
      id: json['id'] as String,
      position: json['position'] as int,
      ballState: BallState.fromJson(json['ballState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClientGameStateImplToJson(
        _$ClientGameStateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position': instance.position,
      'ballState': instance.ballState,
    };
