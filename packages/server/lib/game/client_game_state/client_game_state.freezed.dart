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
  int get position => throw _privateConstructorUsedError;
  BallState get ballState => throw _privateConstructorUsedError;

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
  $Res call({String id, int position, BallState ballState});

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
    Object? position = null,
    Object? ballState = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      ballState: null == ballState
          ? _value.ballState
          : ballState // ignore: cast_nullable_to_non_nullable
              as BallState,
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
  $Res call({String id, int position, BallState ballState});

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
    Object? position = null,
    Object? ballState = null,
  }) {
    return _then(_$ClientGameStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      ballState: null == ballState
          ? _value.ballState
          : ballState // ignore: cast_nullable_to_non_nullable
              as BallState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientGameStateImpl extends _ClientGameState {
  const _$ClientGameStateImpl(
      {required this.id, required this.position, required this.ballState})
      : super._();

  factory _$ClientGameStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientGameStateImplFromJson(json);

  @override
  final String id;
  @override
  final int position;
  @override
  final BallState ballState;

  @override
  String toString() {
    return 'ClientGameState(id: $id, position: $position, ballState: $ballState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientGameStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.ballState, ballState) ||
                other.ballState == ballState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, position, ballState);

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
      required final int position,
      required final BallState ballState}) = _$ClientGameStateImpl;
  const _ClientGameState._() : super._();

  factory _ClientGameState.fromJson(Map<String, dynamic> json) =
      _$ClientGameStateImpl.fromJson;

  @override
  String get id;
  @override
  int get position;
  @override
  BallState get ballState;
  @override
  @JsonKey(ignore: true)
  _$$ClientGameStateImplCopyWith<_$ClientGameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
