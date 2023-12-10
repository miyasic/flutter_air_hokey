// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientState _$ClientStateFromJson(Map<String, dynamic> json) {
  return _ClientState.fromJson(json);
}

/// @nodoc
mixin _$ClientState {
  String get id => throw _privateConstructorUsedError;
  int get paddlePosition => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  BallState? get declaredBallState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientStateCopyWith<ClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientStateCopyWith<$Res> {
  factory $ClientStateCopyWith(
          ClientState value, $Res Function(ClientState) then) =
      _$ClientStateCopyWithImpl<$Res, ClientState>;
  @useResult
  $Res call(
      {String id, int paddlePosition, int point, BallState? declaredBallState});

  $BallStateCopyWith<$Res>? get declaredBallState;
}

/// @nodoc
class _$ClientStateCopyWithImpl<$Res, $Val extends ClientState>
    implements $ClientStateCopyWith<$Res> {
  _$ClientStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paddlePosition = null,
    Object? point = null,
    Object? declaredBallState = freezed,
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
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      declaredBallState: freezed == declaredBallState
          ? _value.declaredBallState
          : declaredBallState // ignore: cast_nullable_to_non_nullable
              as BallState?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BallStateCopyWith<$Res>? get declaredBallState {
    if (_value.declaredBallState == null) {
      return null;
    }

    return $BallStateCopyWith<$Res>(_value.declaredBallState!, (value) {
      return _then(_value.copyWith(declaredBallState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClientStateImplCopyWith<$Res>
    implements $ClientStateCopyWith<$Res> {
  factory _$$ClientStateImplCopyWith(
          _$ClientStateImpl value, $Res Function(_$ClientStateImpl) then) =
      __$$ClientStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, int paddlePosition, int point, BallState? declaredBallState});

  @override
  $BallStateCopyWith<$Res>? get declaredBallState;
}

/// @nodoc
class __$$ClientStateImplCopyWithImpl<$Res>
    extends _$ClientStateCopyWithImpl<$Res, _$ClientStateImpl>
    implements _$$ClientStateImplCopyWith<$Res> {
  __$$ClientStateImplCopyWithImpl(
      _$ClientStateImpl _value, $Res Function(_$ClientStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paddlePosition = null,
    Object? point = null,
    Object? declaredBallState = freezed,
  }) {
    return _then(_$ClientStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paddlePosition: null == paddlePosition
          ? _value.paddlePosition
          : paddlePosition // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      declaredBallState: freezed == declaredBallState
          ? _value.declaredBallState
          : declaredBallState // ignore: cast_nullable_to_non_nullable
              as BallState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientStateImpl extends _ClientState {
  const _$ClientStateImpl(
      {required this.id,
      required this.paddlePosition,
      required this.point,
      this.declaredBallState})
      : super._();

  factory _$ClientStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientStateImplFromJson(json);

  @override
  final String id;
  @override
  final int paddlePosition;
  @override
  final int point;
  @override
  final BallState? declaredBallState;

  @override
  String toString() {
    return 'ClientState(id: $id, paddlePosition: $paddlePosition, point: $point, declaredBallState: $declaredBallState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paddlePosition, paddlePosition) ||
                other.paddlePosition == paddlePosition) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.declaredBallState, declaredBallState) ||
                other.declaredBallState == declaredBallState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, paddlePosition, point, declaredBallState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientStateImplCopyWith<_$ClientStateImpl> get copyWith =>
      __$$ClientStateImplCopyWithImpl<_$ClientStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientStateImplToJson(
      this,
    );
  }
}

abstract class _ClientState extends ClientState {
  const factory _ClientState(
      {required final String id,
      required final int paddlePosition,
      required final int point,
      final BallState? declaredBallState}) = _$ClientStateImpl;
  const _ClientState._() : super._();

  factory _ClientState.fromJson(Map<String, dynamic> json) =
      _$ClientStateImpl.fromJson;

  @override
  String get id;
  @override
  int get paddlePosition;
  @override
  int get point;
  @override
  BallState? get declaredBallState;
  @override
  @JsonKey(ignore: true)
  _$$ClientStateImplCopyWith<_$ClientStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
