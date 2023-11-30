// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state_with_client_queue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameStateWithClientQueue _$GameStateWithClientQueueFromJson(
    Map<String, dynamic> json) {
  return _GameStateWithClientQueue.fromJson(json);
}

/// @nodoc
mixin _$GameStateWithClientQueue {
  GameState get gameState => throw _privateConstructorUsedError;
  Map<String, List<ClientGameState>> get clientGameStateQueue =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStateWithClientQueueCopyWith<GameStateWithClientQueue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateWithClientQueueCopyWith<$Res> {
  factory $GameStateWithClientQueueCopyWith(GameStateWithClientQueue value,
          $Res Function(GameStateWithClientQueue) then) =
      _$GameStateWithClientQueueCopyWithImpl<$Res, GameStateWithClientQueue>;
  @useResult
  $Res call(
      {GameState gameState,
      Map<String, List<ClientGameState>> clientGameStateQueue});

  $GameStateCopyWith<$Res> get gameState;
}

/// @nodoc
class _$GameStateWithClientQueueCopyWithImpl<$Res,
        $Val extends GameStateWithClientQueue>
    implements $GameStateWithClientQueueCopyWith<$Res> {
  _$GameStateWithClientQueueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameState = null,
    Object? clientGameStateQueue = null,
  }) {
    return _then(_value.copyWith(
      gameState: null == gameState
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as GameState,
      clientGameStateQueue: null == clientGameStateQueue
          ? _value.clientGameStateQueue
          : clientGameStateQueue // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ClientGameState>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameStateCopyWith<$Res> get gameState {
    return $GameStateCopyWith<$Res>(_value.gameState, (value) {
      return _then(_value.copyWith(gameState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameStateWithClientQueueImplCopyWith<$Res>
    implements $GameStateWithClientQueueCopyWith<$Res> {
  factory _$$GameStateWithClientQueueImplCopyWith(
          _$GameStateWithClientQueueImpl value,
          $Res Function(_$GameStateWithClientQueueImpl) then) =
      __$$GameStateWithClientQueueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GameState gameState,
      Map<String, List<ClientGameState>> clientGameStateQueue});

  @override
  $GameStateCopyWith<$Res> get gameState;
}

/// @nodoc
class __$$GameStateWithClientQueueImplCopyWithImpl<$Res>
    extends _$GameStateWithClientQueueCopyWithImpl<$Res,
        _$GameStateWithClientQueueImpl>
    implements _$$GameStateWithClientQueueImplCopyWith<$Res> {
  __$$GameStateWithClientQueueImplCopyWithImpl(
      _$GameStateWithClientQueueImpl _value,
      $Res Function(_$GameStateWithClientQueueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameState = null,
    Object? clientGameStateQueue = null,
  }) {
    return _then(_$GameStateWithClientQueueImpl(
      gameState: null == gameState
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as GameState,
      clientGameStateQueue: null == clientGameStateQueue
          ? _value._clientGameStateQueue
          : clientGameStateQueue // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ClientGameState>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStateWithClientQueueImpl extends _GameStateWithClientQueue {
  const _$GameStateWithClientQueueImpl(
      {required this.gameState,
      required final Map<String, List<ClientGameState>> clientGameStateQueue})
      : _clientGameStateQueue = clientGameStateQueue,
        super._();

  factory _$GameStateWithClientQueueImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStateWithClientQueueImplFromJson(json);

  @override
  final GameState gameState;
  final Map<String, List<ClientGameState>> _clientGameStateQueue;
  @override
  Map<String, List<ClientGameState>> get clientGameStateQueue {
    if (_clientGameStateQueue is EqualUnmodifiableMapView)
      return _clientGameStateQueue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_clientGameStateQueue);
  }

  @override
  String toString() {
    return 'GameStateWithClientQueue(gameState: $gameState, clientGameStateQueue: $clientGameStateQueue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateWithClientQueueImpl &&
            (identical(other.gameState, gameState) ||
                other.gameState == gameState) &&
            const DeepCollectionEquality()
                .equals(other._clientGameStateQueue, _clientGameStateQueue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gameState,
      const DeepCollectionEquality().hash(_clientGameStateQueue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateWithClientQueueImplCopyWith<_$GameStateWithClientQueueImpl>
      get copyWith => __$$GameStateWithClientQueueImplCopyWithImpl<
          _$GameStateWithClientQueueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStateWithClientQueueImplToJson(
      this,
    );
  }
}

abstract class _GameStateWithClientQueue extends GameStateWithClientQueue {
  const factory _GameStateWithClientQueue(
      {required final GameState gameState,
      required final Map<String, List<ClientGameState>>
          clientGameStateQueue}) = _$GameStateWithClientQueueImpl;
  const _GameStateWithClientQueue._() : super._();

  factory _GameStateWithClientQueue.fromJson(Map<String, dynamic> json) =
      _$GameStateWithClientQueueImpl.fromJson;

  @override
  GameState get gameState;
  @override
  Map<String, List<ClientGameState>> get clientGameStateQueue;
  @override
  @JsonKey(ignore: true)
  _$$GameStateWithClientQueueImplCopyWith<_$GameStateWithClientQueueImpl>
      get copyWith => throw _privateConstructorUsedError;
}
