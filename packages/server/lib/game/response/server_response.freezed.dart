// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServerResponse<T> _$ServerResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ServerResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ServerResponse<T> {
  ServerResponseType get type => throw _privateConstructorUsedError;
  T get responseDetail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerResponseCopyWith<T, ServerResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerResponseCopyWith<T, $Res> {
  factory $ServerResponseCopyWith(
          ServerResponse<T> value, $Res Function(ServerResponse<T>) then) =
      _$ServerResponseCopyWithImpl<T, $Res, ServerResponse<T>>;
  @useResult
  $Res call({ServerResponseType type, T responseDetail});
}

/// @nodoc
class _$ServerResponseCopyWithImpl<T, $Res, $Val extends ServerResponse<T>>
    implements $ServerResponseCopyWith<T, $Res> {
  _$ServerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? responseDetail = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ServerResponseType,
      responseDetail: freezed == responseDetail
          ? _value.responseDetail
          : responseDetail // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerResponseImplCopyWith<T, $Res>
    implements $ServerResponseCopyWith<T, $Res> {
  factory _$$ServerResponseImplCopyWith(_$ServerResponseImpl<T> value,
          $Res Function(_$ServerResponseImpl<T>) then) =
      __$$ServerResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({ServerResponseType type, T responseDetail});
}

/// @nodoc
class __$$ServerResponseImplCopyWithImpl<T, $Res>
    extends _$ServerResponseCopyWithImpl<T, $Res, _$ServerResponseImpl<T>>
    implements _$$ServerResponseImplCopyWith<T, $Res> {
  __$$ServerResponseImplCopyWithImpl(_$ServerResponseImpl<T> _value,
      $Res Function(_$ServerResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? responseDetail = freezed,
  }) {
    return _then(_$ServerResponseImpl<T>(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ServerResponseType,
      responseDetail: freezed == responseDetail
          ? _value.responseDetail
          : responseDetail // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ServerResponseImpl<T> implements _ServerResponse<T> {
  const _$ServerResponseImpl(
      {required this.type, required this.responseDetail});

  factory _$ServerResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ServerResponseImplFromJson(json, fromJsonT);

  @override
  final ServerResponseType type;
  @override
  final T responseDetail;

  @override
  String toString() {
    return 'ServerResponse<$T>(type: $type, responseDetail: $responseDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerResponseImpl<T> &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.responseDetail, responseDetail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(responseDetail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerResponseImplCopyWith<T, _$ServerResponseImpl<T>> get copyWith =>
      __$$ServerResponseImplCopyWithImpl<T, _$ServerResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ServerResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _ServerResponse<T> implements ServerResponse<T> {
  const factory _ServerResponse(
      {required final ServerResponseType type,
      required final T responseDetail}) = _$ServerResponseImpl<T>;

  factory _ServerResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ServerResponseImpl<T>.fromJson;

  @override
  ServerResponseType get type;
  @override
  T get responseDetail;
  @override
  @JsonKey(ignore: true)
  _$$ServerResponseImplCopyWith<T, _$ServerResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
