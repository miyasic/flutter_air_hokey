// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state_with_client_queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStateWithClientQueueImpl _$$GameStateWithClientQueueImplFromJson(
        Map<String, dynamic> json) =>
    _$GameStateWithClientQueueImpl(
      gameState: GameState.fromJson(json['gameState'] as Map<String, dynamic>),
      clientGameStateQueue:
          (json['clientGameStateQueue'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => ClientGameState.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$$GameStateWithClientQueueImplToJson(
        _$GameStateWithClientQueueImpl instance) =>
    <String, dynamic>{
      'gameState': instance.gameState,
      'clientGameStateQueue': instance.clientGameStateQueue,
    };
