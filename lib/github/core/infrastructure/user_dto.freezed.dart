// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) {
  return _UserDTO.fromJson(json);
}

/// @nodoc
mixin _$UserDTO {
// ignore: invalid_annotation_target
  @JsonKey(name: 'login')
  String get name => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDTOCopyWith<UserDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDTOCopyWith<$Res> {
  factory $UserDTOCopyWith(UserDTO value, $Res Function(UserDTO) then) =
      _$UserDTOCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'login') String name, String avatarUrl});
}

/// @nodoc
class _$UserDTOCopyWithImpl<$Res> implements $UserDTOCopyWith<$Res> {
  _$UserDTOCopyWithImpl(this._value, this._then);

  final UserDTO _value;
  // ignore: unused_field
  final $Res Function(UserDTO) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: avatarUrl == freezed
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserDTOCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory _$$_UserDTOCopyWith(
          _$_UserDTO value, $Res Function(_$_UserDTO) then) =
      __$$_UserDTOCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'login') String name, String avatarUrl});
}

/// @nodoc
class __$$_UserDTOCopyWithImpl<$Res> extends _$UserDTOCopyWithImpl<$Res>
    implements _$$_UserDTOCopyWith<$Res> {
  __$$_UserDTOCopyWithImpl(_$_UserDTO _value, $Res Function(_$_UserDTO) _then)
      : super(_value, (v) => _then(v as _$_UserDTO));

  @override
  _$_UserDTO get _value => super._value as _$_UserDTO;

  @override
  $Res call({
    Object? name = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_$_UserDTO(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: avatarUrl == freezed
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_UserDTO extends _UserDTO with DiagnosticableTreeMixin {
  const _$_UserDTO(
      {@JsonKey(name: 'login') required this.name, required this.avatarUrl})
      : super._();

  factory _$_UserDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserDTOFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'login')
  final String name;
  @override
  final String avatarUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserDTO(name: $name, avatarUrl: $avatarUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserDTO'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('avatarUrl', avatarUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDTO &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.avatarUrl, avatarUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(avatarUrl));

  @JsonKey(ignore: true)
  @override
  _$$_UserDTOCopyWith<_$_UserDTO> get copyWith =>
      __$$_UserDTOCopyWithImpl<_$_UserDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDTOToJson(this);
  }
}

abstract class _UserDTO extends UserDTO {
  const factory _UserDTO(
      {@JsonKey(name: 'login') required final String name,
      required final String avatarUrl}) = _$_UserDTO;
  const _UserDTO._() : super._();

  factory _UserDTO.fromJson(Map<String, dynamic> json) = _$_UserDTO.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'login')
  String get name => throw _privateConstructorUsedError;
  @override
  String get avatarUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserDTOCopyWith<_$_UserDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
