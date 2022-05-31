// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_repo_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GithubRepoDetailDto _$GithubRepoDetailDtoFromJson(Map<String, dynamic> json) {
  return _GithubRepoDetailDto.fromJson(json);
}

/// @nodoc
mixin _$GithubRepoDetailDto {
  String get html => throw _privateConstructorUsedError;
  bool get starred => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubRepoDetailDtoCopyWith<GithubRepoDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepoDetailDtoCopyWith<$Res> {
  factory $GithubRepoDetailDtoCopyWith(
          GithubRepoDetailDto value, $Res Function(GithubRepoDetailDto) then) =
      _$GithubRepoDetailDtoCopyWithImpl<$Res>;
  $Res call({String html, bool starred, String fullName});
}

/// @nodoc
class _$GithubRepoDetailDtoCopyWithImpl<$Res>
    implements $GithubRepoDetailDtoCopyWith<$Res> {
  _$GithubRepoDetailDtoCopyWithImpl(this._value, this._then);

  final GithubRepoDetailDto _value;
  // ignore: unused_field
  final $Res Function(GithubRepoDetailDto) _then;

  @override
  $Res call({
    Object? html = freezed,
    Object? starred = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_value.copyWith(
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
      starred: starred == freezed
          ? _value.starred
          : starred // ignore: cast_nullable_to_non_nullable
              as bool,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GithubRepoDetailDtoCopyWith<$Res>
    implements $GithubRepoDetailDtoCopyWith<$Res> {
  factory _$$_GithubRepoDetailDtoCopyWith(_$_GithubRepoDetailDto value,
          $Res Function(_$_GithubRepoDetailDto) then) =
      __$$_GithubRepoDetailDtoCopyWithImpl<$Res>;
  @override
  $Res call({String html, bool starred, String fullName});
}

/// @nodoc
class __$$_GithubRepoDetailDtoCopyWithImpl<$Res>
    extends _$GithubRepoDetailDtoCopyWithImpl<$Res>
    implements _$$_GithubRepoDetailDtoCopyWith<$Res> {
  __$$_GithubRepoDetailDtoCopyWithImpl(_$_GithubRepoDetailDto _value,
      $Res Function(_$_GithubRepoDetailDto) _then)
      : super(_value, (v) => _then(v as _$_GithubRepoDetailDto));

  @override
  _$_GithubRepoDetailDto get _value => super._value as _$_GithubRepoDetailDto;

  @override
  $Res call({
    Object? html = freezed,
    Object? starred = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_$_GithubRepoDetailDto(
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
      starred: starred == freezed
          ? _value.starred
          : starred // ignore: cast_nullable_to_non_nullable
              as bool,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GithubRepoDetailDto implements _GithubRepoDetailDto {
  const _$_GithubRepoDetailDto(
      {required this.html, required this.starred, required this.fullName});

  factory _$_GithubRepoDetailDto.fromJson(Map<String, dynamic> json) =>
      _$$_GithubRepoDetailDtoFromJson(json);

  @override
  final String html;
  @override
  final bool starred;
  @override
  final String fullName;

  @override
  String toString() {
    return 'GithubRepoDetailDto(html: $html, starred: $starred, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GithubRepoDetailDto &&
            const DeepCollectionEquality().equals(other.html, html) &&
            const DeepCollectionEquality().equals(other.starred, starred) &&
            const DeepCollectionEquality().equals(other.fullName, fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(html),
      const DeepCollectionEquality().hash(starred),
      const DeepCollectionEquality().hash(fullName));

  @JsonKey(ignore: true)
  @override
  _$$_GithubRepoDetailDtoCopyWith<_$_GithubRepoDetailDto> get copyWith =>
      __$$_GithubRepoDetailDtoCopyWithImpl<_$_GithubRepoDetailDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GithubRepoDetailDtoToJson(this);
  }
}

abstract class _GithubRepoDetailDto implements GithubRepoDetailDto {
  const factory _GithubRepoDetailDto(
      {required final String html,
      required final bool starred,
      required final String fullName}) = _$_GithubRepoDetailDto;

  factory _GithubRepoDetailDto.fromJson(Map<String, dynamic> json) =
      _$_GithubRepoDetailDto.fromJson;

  @override
  String get html => throw _privateConstructorUsedError;
  @override
  bool get starred => throw _privateConstructorUsedError;
  @override
  String get fullName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GithubRepoDetailDtoCopyWith<_$_GithubRepoDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}
