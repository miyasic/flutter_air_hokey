// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Start _$StartFromJson(Map<String, dynamic> json) {
  return _Start.fromJson(json);
}

/// @nodoc
mixin _$Start {
  /// ユーザーのID
  String get id => throw _privateConstructorUsedError;
  BallState get ballState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartCopyWith<Start> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartCopyWith<$Res> {
  factory $StartCopyWith(Start value, $Res Function(Start) then) =
      _$StartCopyWithImpl<$Res, Start>;
  @useResult
  $Res call({String id, BallState ballState});

  $BallStateCopyWith<$Res> get ballState;
}

/// @nodoc
class _$StartCopyWithImpl<$Res, $Val extends Start>
    implements $StartCopyWith<$Res> {
  _$StartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ballState = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$StartImplCopyWith<$Res> implements $StartCopyWith<$Res> {
  factory _$$StartImplCopyWith(
          _$StartImpl value, $Res Function(_$StartImpl) then) =
      __$$StartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, BallState ballState});

  @override
  $BallStateCopyWith<$Res> get ballState;
}

/// @nodoc
class __$$StartImplCopyWithImpl<$Res>
    extends _$StartCopyWithImpl<$Res, _$StartImpl>
    implements _$$StartImplCopyWith<$Res> {
  __$$StartImplCopyWithImpl(
      _$StartImpl _value, $Res Function(_$StartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ballState = null,
  }) {
    return _then(_$StartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ballState: null == ballState
          ? _value.ballState
          : ballState // ignore: cast_nullable_to_non_nullable
              as BallState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartImpl extends _Start {
  const _$StartImpl({required this.id, required this.ballState}) : super._();

  factory _$StartImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartImplFromJson(json);

  /// ユーザーのID
  @override
  final String id;
  @override
  final BallState ballState;

  @override
  String toString() {
    return 'Start(id: $id, ballState: $ballState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ballState, ballState) ||
                other.ballState == ballState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, ballState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartImplCopyWith<_$StartImpl> get copyWith =>
      __$$StartImplCopyWithImpl<_$StartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartImplToJson(
      this,
    );
  }
}

abstract class _Start extends Start {
  const factory _Start(
      {required final String id,
      required final BallState ballState}) = _$StartImpl;
  const _Start._() : super._();

  factory _Start.fromJson(Map<String, dynamic> json) = _$StartImpl.fromJson;

  @override

  /// ユーザーのID
  String get id;
  @override
  BallState get ballState;
  @override
  @JsonKey(ignore: true)
  _$$StartImplCopyWith<_$StartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
