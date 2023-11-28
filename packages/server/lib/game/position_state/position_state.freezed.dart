// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'position_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PositionState _$PositionStateFromJson(Map<String, dynamic> json) {
  return _PositionState.fromJson(json);
}

/// @nodoc
mixin _$PositionState {
  /// ユーザーのID
  String get id => throw _privateConstructorUsedError;

  /// ユーザーのタイプ
  UserRole get userRole => throw _privateConstructorUsedError;

  /// ゲームの状態
  int get paddlePosition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionStateCopyWith<PositionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionStateCopyWith<$Res> {
  factory $PositionStateCopyWith(
          PositionState value, $Res Function(PositionState) then) =
      _$PositionStateCopyWithImpl<$Res, PositionState>;
  @useResult
  $Res call({String id, UserRole userRole, int paddlePosition});
}

/// @nodoc
class _$PositionStateCopyWithImpl<$Res, $Val extends PositionState>
    implements $PositionStateCopyWith<$Res> {
  _$PositionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userRole = null,
    Object? paddlePosition = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userRole: null == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as UserRole,
      paddlePosition: null == paddlePosition
          ? _value.paddlePosition
          : paddlePosition // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionStateImplCopyWith<$Res>
    implements $PositionStateCopyWith<$Res> {
  factory _$$PositionStateImplCopyWith(
          _$PositionStateImpl value, $Res Function(_$PositionStateImpl) then) =
      __$$PositionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, UserRole userRole, int paddlePosition});
}

/// @nodoc
class __$$PositionStateImplCopyWithImpl<$Res>
    extends _$PositionStateCopyWithImpl<$Res, _$PositionStateImpl>
    implements _$$PositionStateImplCopyWith<$Res> {
  __$$PositionStateImplCopyWithImpl(
      _$PositionStateImpl _value, $Res Function(_$PositionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userRole = null,
    Object? paddlePosition = null,
  }) {
    return _then(_$PositionStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userRole: null == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as UserRole,
      paddlePosition: null == paddlePosition
          ? _value.paddlePosition
          : paddlePosition // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionStateImpl extends _PositionState {
  const _$PositionStateImpl(
      {required this.id, required this.userRole, required this.paddlePosition})
      : super._();

  factory _$PositionStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionStateImplFromJson(json);

  /// ユーザーのID
  @override
  final String id;

  /// ユーザーのタイプ
  @override
  final UserRole userRole;

  /// ゲームの状態
  @override
  final int paddlePosition;

  @override
  String toString() {
    return 'PositionState(id: $id, userRole: $userRole, paddlePosition: $paddlePosition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userRole, userRole) ||
                other.userRole == userRole) &&
            (identical(other.paddlePosition, paddlePosition) ||
                other.paddlePosition == paddlePosition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userRole, paddlePosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionStateImplCopyWith<_$PositionStateImpl> get copyWith =>
      __$$PositionStateImplCopyWithImpl<_$PositionStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionStateImplToJson(
      this,
    );
  }
}

abstract class _PositionState extends PositionState {
  const factory _PositionState(
      {required final String id,
      required final UserRole userRole,
      required final int paddlePosition}) = _$PositionStateImpl;
  const _PositionState._() : super._();

  factory _PositionState.fromJson(Map<String, dynamic> json) =
      _$PositionStateImpl.fromJson;

  @override

  /// ユーザーのID
  String get id;
  @override

  /// ユーザーのタイプ
  UserRole get userRole;
  @override

  /// ゲームの状態
  int get paddlePosition;
  @override
  @JsonKey(ignore: true)
  _$$PositionStateImplCopyWith<_$PositionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
