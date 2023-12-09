// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return _GameState.fromJson(json);
}

/// @nodoc
mixin _$GameState {
  List<String> get ids => throw _privateConstructorUsedError;
  BallState? get ballState => throw _privateConstructorUsedError;
  Map<String, ClientState> get clientStateMap =>
      throw _privateConstructorUsedError;
  int get serverLoop => throw _privateConstructorUsedError;
  bool get isFixed => throw _privateConstructorUsedError;
  bool get isReset => throw _privateConstructorUsedError;
  bool get isGoal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {List<String> ids,
      BallState? ballState,
      Map<String, ClientState> clientStateMap,
      int serverLoop,
      bool isFixed,
      bool isReset,
      bool isGoal});

  $BallStateCopyWith<$Res>? get ballState;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? ballState = freezed,
    Object? clientStateMap = null,
    Object? serverLoop = null,
    Object? isFixed = null,
    Object? isReset = null,
    Object? isGoal = null,
  }) {
    return _then(_value.copyWith(
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ballState: freezed == ballState
          ? _value.ballState
          : ballState // ignore: cast_nullable_to_non_nullable
              as BallState?,
      clientStateMap: null == clientStateMap
          ? _value.clientStateMap
          : clientStateMap // ignore: cast_nullable_to_non_nullable
              as Map<String, ClientState>,
      serverLoop: null == serverLoop
          ? _value.serverLoop
          : serverLoop // ignore: cast_nullable_to_non_nullable
              as int,
      isFixed: null == isFixed
          ? _value.isFixed
          : isFixed // ignore: cast_nullable_to_non_nullable
              as bool,
      isReset: null == isReset
          ? _value.isReset
          : isReset // ignore: cast_nullable_to_non_nullable
              as bool,
      isGoal: null == isGoal
          ? _value.isGoal
          : isGoal // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BallStateCopyWith<$Res>? get ballState {
    if (_value.ballState == null) {
      return null;
    }

    return $BallStateCopyWith<$Res>(_value.ballState!, (value) {
      return _then(_value.copyWith(ballState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
          _$GameStateImpl value, $Res Function(_$GameStateImpl) then) =
      __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> ids,
      BallState? ballState,
      Map<String, ClientState> clientStateMap,
      int serverLoop,
      bool isFixed,
      bool isReset,
      bool isGoal});

  @override
  $BallStateCopyWith<$Res>? get ballState;
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? ballState = freezed,
    Object? clientStateMap = null,
    Object? serverLoop = null,
    Object? isFixed = null,
    Object? isReset = null,
    Object? isGoal = null,
  }) {
    return _then(_$GameStateImpl(
      ids: null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ballState: freezed == ballState
          ? _value.ballState
          : ballState // ignore: cast_nullable_to_non_nullable
              as BallState?,
      clientStateMap: null == clientStateMap
          ? _value._clientStateMap
          : clientStateMap // ignore: cast_nullable_to_non_nullable
              as Map<String, ClientState>,
      serverLoop: null == serverLoop
          ? _value.serverLoop
          : serverLoop // ignore: cast_nullable_to_non_nullable
              as int,
      isFixed: null == isFixed
          ? _value.isFixed
          : isFixed // ignore: cast_nullable_to_non_nullable
              as bool,
      isReset: null == isReset
          ? _value.isReset
          : isReset // ignore: cast_nullable_to_non_nullable
              as bool,
      isGoal: null == isGoal
          ? _value.isGoal
          : isGoal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStateImpl extends _GameState {
  const _$GameStateImpl(
      {required final List<String> ids,
      this.ballState,
      required final Map<String, ClientState> clientStateMap,
      required this.serverLoop,
      this.isFixed = false,
      this.isReset = false,
      this.isGoal = false})
      : _ids = ids,
        _clientStateMap = clientStateMap,
        super._();

  factory _$GameStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStateImplFromJson(json);

  final List<String> _ids;
  @override
  List<String> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  final BallState? ballState;
  final Map<String, ClientState> _clientStateMap;
  @override
  Map<String, ClientState> get clientStateMap {
    if (_clientStateMap is EqualUnmodifiableMapView) return _clientStateMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_clientStateMap);
  }

  @override
  final int serverLoop;
  @override
  @JsonKey()
  final bool isFixed;
  @override
  @JsonKey()
  final bool isReset;
  @override
  @JsonKey()
  final bool isGoal;

  @override
  String toString() {
    return 'GameState(ids: $ids, ballState: $ballState, clientStateMap: $clientStateMap, serverLoop: $serverLoop, isFixed: $isFixed, isReset: $isReset, isGoal: $isGoal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            const DeepCollectionEquality().equals(other._ids, _ids) &&
            (identical(other.ballState, ballState) ||
                other.ballState == ballState) &&
            const DeepCollectionEquality()
                .equals(other._clientStateMap, _clientStateMap) &&
            (identical(other.serverLoop, serverLoop) ||
                other.serverLoop == serverLoop) &&
            (identical(other.isFixed, isFixed) || other.isFixed == isFixed) &&
            (identical(other.isReset, isReset) || other.isReset == isReset) &&
            (identical(other.isGoal, isGoal) || other.isGoal == isGoal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ids),
      ballState,
      const DeepCollectionEquality().hash(_clientStateMap),
      serverLoop,
      isFixed,
      isReset,
      isGoal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStateImplToJson(
      this,
    );
  }
}

abstract class _GameState extends GameState {
  const factory _GameState(
      {required final List<String> ids,
      final BallState? ballState,
      required final Map<String, ClientState> clientStateMap,
      required final int serverLoop,
      final bool isFixed,
      final bool isReset,
      final bool isGoal}) = _$GameStateImpl;
  const _GameState._() : super._();

  factory _GameState.fromJson(Map<String, dynamic> json) =
      _$GameStateImpl.fromJson;

  @override
  List<String> get ids;
  @override
  BallState? get ballState;
  @override
  Map<String, ClientState> get clientStateMap;
  @override
  int get serverLoop;
  @override
  bool get isFixed;
  @override
  bool get isReset;
  @override
  bool get isGoal;
  @override
  @JsonKey(ignore: true)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
