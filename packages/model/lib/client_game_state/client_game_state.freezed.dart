// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientGameState _$ClientGameStateFromJson(Map<String, dynamic> json) {
  return _ClientGameState.fromJson(json);
}

/// @nodoc
mixin _$ClientGameState {
  String get id => throw _privateConstructorUsedError;
  int get paddlePosition => throw _privateConstructorUsedError;
  BallState get ballState => throw _privateConstructorUsedError;
  int get serverLoopCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientGameStateCopyWith<ClientGameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientGameStateCopyWith<$Res> {
  factory $ClientGameStateCopyWith(
          ClientGameState value, $Res Function(ClientGameState) then) =
      _$ClientGameStateCopyWithImpl<$Res, ClientGameState>;
  @useResult
  $Res call(
      {String id,
      int paddlePosition,
      BallState ballState,
      int serverLoopCount});

  $BallStateCopyWith<$Res> get ballState;
}

/// @nodoc
class _$ClientGameStateCopyWithImpl<$Res, $Val extends ClientGameState>
    implements $ClientGameStateCopyWith<$Res> {
  _$ClientGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paddlePosition = null,
    Object? ballState = null,
    Object? serverLoopCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paddlePosition: null == paddlePosition
          ? _value.paddlePosition
          : paddlePosition // ignore: cast_nullable_to_non_nullable
              as int,
      ballState: null == ballState
          ? _value.ballState
          : ballState // ignore: cast_nullable_to_non_nullable
              as BallState,
      serverLoopCount: null == serverLoopCount
          ? _value.serverLoopCount
          : serverLoopCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BallStateCopyWith<$Res> get ballState {
    return $BallStateCopyWith<$Res>(_value.ballState, (value) {
      return _then(_value.copyWith(ballState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClientGameStateImplCopyWith<$Res>
    implements $ClientGameStateCopyWith<$Res> {
  factory _$$ClientGameStateImplCopyWith(_$ClientGameStateImpl value,
          $Res Function(_$ClientGameStateImpl) then) =
      __$$ClientGameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int paddlePosition,
      BallState ballState,
      int serverLoopCount});

  @override
  $BallStateCopyWith<$Res> get ballState;
}

/// @nodoc
class __$$ClientGameStateImplCopyWithImpl<$Res>
    extends _$ClientGameStateCopyWithImpl<$Res, _$ClientGameStateImpl>
    implements _$$ClientGameStateImplCopyWith<$Res> {
  __$$ClientGameStateImplCopyWithImpl(
      _$ClientGameStateImpl _value, $Res Function(_$ClientGameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paddlePosition = null,
    Object? ballState = null,
    Object? serverLoopCount = null,
  }) {
    return _then(_$ClientGameStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paddlePosition: null == paddlePosition
          ? _value.paddlePosition
          : paddlePosition // ignore: cast_nullable_to_non_nullable
              as int,
      ballState: null == ballState
          ? _value.ballState
          : ballState // ignore: cast_nullable_to_non_nullable
              as BallState,
      serverLoopCount: null == serverLoopCount
          ? _value.serverLoopCount
          : serverLoopCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientGameStateImpl extends _ClientGameState {
  const _$ClientGameStateImpl(
      {required this.id,
      required this.paddlePosition,
      required this.ballState,
      required this.serverLoopCount})
      : super._();

  factory _$ClientGameStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientGameStateImplFromJson(json);

  @override
  final String id;
  @override
  final int paddlePosition;
  @override
  final BallState ballState;
  @override
  final int serverLoopCount;

  @override
  String toString() {
    return 'ClientGameState(id: $id, paddlePosition: $paddlePosition, ballState: $ballState, serverLoopCount: $serverLoopCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientGameStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paddlePosition, paddlePosition) ||
                other.paddlePosition == paddlePosition) &&
            (identical(other.ballState, ballState) ||
                other.ballState == ballState) &&
            (identical(other.serverLoopCount, serverLoopCount) ||
                other.serverLoopCount == serverLoopCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, paddlePosition, ballState, serverLoopCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientGameStateImplCopyWith<_$ClientGameStateImpl> get copyWith =>
      __$$ClientGameStateImplCopyWithImpl<_$ClientGameStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientGameStateImplToJson(
      this,
    );
  }
}

abstract class _ClientGameState extends ClientGameState {
  const factory _ClientGameState(
      {required final String id,
      required final int paddlePosition,
      required final BallState ballState,
      required final int serverLoopCount}) = _$ClientGameStateImpl;
  const _ClientGameState._() : super._();

  factory _ClientGameState.fromJson(Map<String, dynamic> json) =
      _$ClientGameStateImpl.fromJson;

  @override
  String get id;
  @override
  int get paddlePosition;
  @override
  BallState get ballState;
  @override
  int get serverLoopCount;
  @override
  @JsonKey(ignore: true)
  _$$ClientGameStateImplCopyWith<_$ClientGameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
