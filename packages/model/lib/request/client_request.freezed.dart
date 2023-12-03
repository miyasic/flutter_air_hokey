// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientRequest<T> _$ClientRequestFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ClientRequest<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ClientRequest<T> {
  ClientRequestType get type => throw _privateConstructorUsedError;
  T get requestDetail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientRequestCopyWith<T, ClientRequest<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientRequestCopyWith<T, $Res> {
  factory $ClientRequestCopyWith(
          ClientRequest<T> value, $Res Function(ClientRequest<T>) then) =
      _$ClientRequestCopyWithImpl<T, $Res, ClientRequest<T>>;
  @useResult
  $Res call({ClientRequestType type, T requestDetail});
}

/// @nodoc
class _$ClientRequestCopyWithImpl<T, $Res, $Val extends ClientRequest<T>>
    implements $ClientRequestCopyWith<T, $Res> {
  _$ClientRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? requestDetail = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ClientRequestType,
      requestDetail: freezed == requestDetail
          ? _value.requestDetail
          : requestDetail // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientRequestImplCopyWith<T, $Res>
    implements $ClientRequestCopyWith<T, $Res> {
  factory _$$ClientRequestImplCopyWith(_$ClientRequestImpl<T> value,
          $Res Function(_$ClientRequestImpl<T>) then) =
      __$$ClientRequestImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({ClientRequestType type, T requestDetail});
}

/// @nodoc
class __$$ClientRequestImplCopyWithImpl<T, $Res>
    extends _$ClientRequestCopyWithImpl<T, $Res, _$ClientRequestImpl<T>>
    implements _$$ClientRequestImplCopyWith<T, $Res> {
  __$$ClientRequestImplCopyWithImpl(_$ClientRequestImpl<T> _value,
      $Res Function(_$ClientRequestImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? requestDetail = freezed,
  }) {
    return _then(_$ClientRequestImpl<T>(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ClientRequestType,
      requestDetail: freezed == requestDetail
          ? _value.requestDetail
          : requestDetail // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ClientRequestImpl<T> extends _ClientRequest<T> {
  const _$ClientRequestImpl({required this.type, required this.requestDetail})
      : super._();

  factory _$ClientRequestImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ClientRequestImplFromJson(json, fromJsonT);

  @override
  final ClientRequestType type;
  @override
  final T requestDetail;

  @override
  String toString() {
    return 'ClientRequest<$T>(type: $type, requestDetail: $requestDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientRequestImpl<T> &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.requestDetail, requestDetail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(requestDetail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientRequestImplCopyWith<T, _$ClientRequestImpl<T>> get copyWith =>
      __$$ClientRequestImplCopyWithImpl<T, _$ClientRequestImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ClientRequestImplToJson<T>(this, toJsonT);
  }
}

abstract class _ClientRequest<T> extends ClientRequest<T> {
  const factory _ClientRequest(
      {required final ClientRequestType type,
      required final T requestDetail}) = _$ClientRequestImpl<T>;
  const _ClientRequest._() : super._();

  factory _ClientRequest.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ClientRequestImpl<T>.fromJson;

  @override
  ClientRequestType get type;
  @override
  T get requestDetail;
  @override
  @JsonKey(ignore: true)
  _$$ClientRequestImplCopyWith<T, _$ClientRequestImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
