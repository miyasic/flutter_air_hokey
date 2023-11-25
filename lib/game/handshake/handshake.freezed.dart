// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'handshake.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Handshake _$HandshakeFromJson(Map<String, dynamic> json) {
  return _Handshake.fromJson(json);
}

/// @nodoc
mixin _$Handshake {
  /// ユーザーのID
  String get id => throw _privateConstructorUsedError;

  /// ユーザーのタイプ
  UserRole get userRole => throw _privateConstructorUsedError;

  /// ゲームの状態
  GameState get gameState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HandshakeCopyWith<Handshake> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HandshakeCopyWith<$Res> {
  factory $HandshakeCopyWith(Handshake value, $Res Function(Handshake) then) =
      _$HandshakeCopyWithImpl<$Res, Handshake>;
  @useResult
  $Res call({String id, UserRole userRole, GameState gameState});

  $GameStateCopyWith<$Res> get gameState;
}

/// @nodoc
class _$HandshakeCopyWithImpl<$Res, $Val extends Handshake>
    implements $HandshakeCopyWith<$Res> {
  _$HandshakeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userRole = null,
    Object? gameState = null,
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
      gameState: null == gameState
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as GameState,
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
abstract class _$$HandshakeImplCopyWith<$Res>
    implements $HandshakeCopyWith<$Res> {
  factory _$$HandshakeImplCopyWith(
          _$HandshakeImpl value, $Res Function(_$HandshakeImpl) then) =
      __$$HandshakeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, UserRole userRole, GameState gameState});

  @override
  $GameStateCopyWith<$Res> get gameState;
}

/// @nodoc
class __$$HandshakeImplCopyWithImpl<$Res>
    extends _$HandshakeCopyWithImpl<$Res, _$HandshakeImpl>
    implements _$$HandshakeImplCopyWith<$Res> {
  __$$HandshakeImplCopyWithImpl(
      _$HandshakeImpl _value, $Res Function(_$HandshakeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userRole = null,
    Object? gameState = null,
  }) {
    return _then(_$HandshakeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userRole: null == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as UserRole,
      gameState: null == gameState
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as GameState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HandshakeImpl extends _Handshake {
  const _$HandshakeImpl(
      {required this.id, required this.userRole, required this.gameState})
      : super._();

  factory _$HandshakeImpl.fromJson(Map<String, dynamic> json) =>
      _$$HandshakeImplFromJson(json);

  /// ユーザーのID
  @override
  final String id;

  /// ユーザーのタイプ
  @override
  final UserRole userRole;

  /// ゲームの状態
  @override
  final GameState gameState;

  @override
  String toString() {
    return 'Handshake(id: $id, userRole: $userRole, gameState: $gameState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HandshakeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userRole, userRole) ||
                other.userRole == userRole) &&
            (identical(other.gameState, gameState) ||
                other.gameState == gameState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userRole, gameState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HandshakeImplCopyWith<_$HandshakeImpl> get copyWith =>
      __$$HandshakeImplCopyWithImpl<_$HandshakeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HandshakeImplToJson(
      this,
    );
  }
}

abstract class _Handshake extends Handshake {
  const factory _Handshake(
      {required final String id,
      required final UserRole userRole,
      required final GameState gameState}) = _$HandshakeImpl;
  const _Handshake._() : super._();

  factory _Handshake.fromJson(Map<String, dynamic> json) =
      _$HandshakeImpl.fromJson;

  @override

  /// ユーザーのID
  String get id;
  @override

  /// ユーザーのタイプ
  UserRole get userRole;
  @override

  /// ゲームの状態
  GameState get gameState;
  @override
  @JsonKey(ignore: true)
  _$$HandshakeImplCopyWith<_$HandshakeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
