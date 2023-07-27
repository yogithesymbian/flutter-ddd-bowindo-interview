// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'error_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorDTO _$ErrorDTOFromJson(Map<String, dynamic> json) {
  return _ErrorDTO.fromJson(json);
}

/// @nodoc
mixin _$ErrorDTO {
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorDTOCopyWith<ErrorDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorDTOCopyWith<$Res> {
  factory $ErrorDTOCopyWith(ErrorDTO value, $Res Function(ErrorDTO) then) =
      _$ErrorDTOCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$ErrorDTOCopyWithImpl<$Res> implements $ErrorDTOCopyWith<$Res> {
  _$ErrorDTOCopyWithImpl(this._value, this._then);

  final ErrorDTO _value;
  // ignore: unused_field
  final $Res Function(ErrorDTO) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ErrorDTOCopyWith<$Res> implements $ErrorDTOCopyWith<$Res> {
  factory _$$_ErrorDTOCopyWith(
          _$_ErrorDTO value, $Res Function(_$_ErrorDTO) then) =
      __$$_ErrorDTOCopyWithImpl<$Res>;
  @override
  $Res call({String? message});
}

/// @nodoc
class __$$_ErrorDTOCopyWithImpl<$Res> extends _$ErrorDTOCopyWithImpl<$Res>
    implements _$$_ErrorDTOCopyWith<$Res> {
  __$$_ErrorDTOCopyWithImpl(
      _$_ErrorDTO _value, $Res Function(_$_ErrorDTO) _then)
      : super(_value, (v) => _then(v as _$_ErrorDTO));

  @override
  _$_ErrorDTO get _value => super._value as _$_ErrorDTO;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_ErrorDTO(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ErrorDTO implements _ErrorDTO {
  const _$_ErrorDTO({this.message});

  factory _$_ErrorDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorDTOFromJson(json);

  @override
  final String? message;

  @override
  String toString() {
    return 'ErrorDTO(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorDTO &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorDTOCopyWith<_$_ErrorDTO> get copyWith =>
      __$$_ErrorDTOCopyWithImpl<_$_ErrorDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorDTOToJson(
      this,
    );
  }
}

abstract class _ErrorDTO implements ErrorDTO {
  const factory _ErrorDTO({final String? message}) = _$_ErrorDTO;

  factory _ErrorDTO.fromJson(Map<String, dynamic> json) = _$_ErrorDTO.fromJson;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorDTOCopyWith<_$_ErrorDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
