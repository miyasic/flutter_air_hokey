// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ball_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BallState _$BallStateFromJson(Map<String, dynamic> json) {
  return _BallState.fromJson(json);
}

/// @nodoc
mixin _$BallState {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get vx => throw _privateConstructorUsedError;
  double get vy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BallStateCopyWith<BallState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BallStateCopyWith<$Res> {
  factory $BallStateCopyWith(BallState value, $Res Function(BallState) then) =
      _$BallStateCopyWithImpl<$Res, BallState>;
  @useResult
  $Res call({double x, double y, double vx, double vy});
}

/// @nodoc
class _$BallStateCopyWithImpl<$Res, $Val extends BallState>
    implements $BallStateCopyWith<$Res> {
  _$BallStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? vx = null,
    Object? vy = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      vx: null == vx
          ? _value.vx
          : vx // ignore: cast_nullable_to_non_nullable
              as double,
      vy: null == vy
          ? _value.vy
          : vy // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BallStateImplCopyWith<$Res>
    implements $BallStateCopyWith<$Res> {
  factory _$$BallStateImplCopyWith(
          _$BallStateImpl value, $Res Function(_$BallStateImpl) then) =
      __$$BallStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y, double vx, double vy});
}

/// @nodoc
class __$$BallStateImplCopyWithImpl<$Res>
    extends _$BallStateCopyWithImpl<$Res, _$BallStateImpl>
    implements _$$BallStateImplCopyWith<$Res> {
  __$$BallStateImplCopyWithImpl(
      _$BallStateImpl _value, $Res Function(_$BallStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? vx = null,
    Object? vy = null,
  }) {
    return _then(_$BallStateImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      vx: null == vx
          ? _value.vx
          : vx // ignore: cast_nullable_to_non_nullable
              as double,
      vy: null == vy
          ? _value.vy
          : vy // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BallStateImpl extends _BallState {
  const _$BallStateImpl(
      {required this.x, required this.y, required this.vx, required this.vy})
      : super._();

  factory _$BallStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$BallStateImplFromJson(json);

  @override
  final double x;
  @override
  final double y;
  @override
  final double vx;
  @override
  final double vy;

  @override
  String toString() {
    return 'BallState(x: $x, y: $y, vx: $vx, vy: $vy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BallStateImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.vx, vx) || other.vx == vx) &&
            (identical(other.vy, vy) || other.vy == vy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, vx, vy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BallStateImplCopyWith<_$BallStateImpl> get copyWith =>
      __$$BallStateImplCopyWithImpl<_$BallStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BallStateImplToJson(
      this,
    );
  }
}

abstract class _BallState extends BallState {
  const factory _BallState(
      {required final double x,
      required final double y,
      required final double vx,
      required final double vy}) = _$BallStateImpl;
  const _BallState._() : super._();

  factory _BallState.fromJson(Map<String, dynamic> json) =
      _$BallStateImpl.fromJson;

  @override
  double get x;
  @override
  double get y;
  @override
  double get vx;
  @override
  double get vy;
  @override
  @JsonKey(ignore: true)
  _$$BallStateImplCopyWith<_$BallStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
