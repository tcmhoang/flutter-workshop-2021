// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_repo_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GithubRepoDetail {
  String get html => throw _privateConstructorUsedError;
  bool get starred => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GithubRepoDetailCopyWith<GithubRepoDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepoDetailCopyWith<$Res> {
  factory $GithubRepoDetailCopyWith(
          GithubRepoDetail value, $Res Function(GithubRepoDetail) then) =
      _$GithubRepoDetailCopyWithImpl<$Res>;
  $Res call({String html, bool starred, String fullName});
}

/// @nodoc
class _$GithubRepoDetailCopyWithImpl<$Res>
    implements $GithubRepoDetailCopyWith<$Res> {
  _$GithubRepoDetailCopyWithImpl(this._value, this._then);

  final GithubRepoDetail _value;
  // ignore: unused_field
  final $Res Function(GithubRepoDetail) _then;

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
abstract class _$$_GithubRepoDetailCopyWith<$Res>
    implements $GithubRepoDetailCopyWith<$Res> {
  factory _$$_GithubRepoDetailCopyWith(
          _$_GithubRepoDetail value, $Res Function(_$_GithubRepoDetail) then) =
      __$$_GithubRepoDetailCopyWithImpl<$Res>;
  @override
  $Res call({String html, bool starred, String fullName});
}

/// @nodoc
class __$$_GithubRepoDetailCopyWithImpl<$Res>
    extends _$GithubRepoDetailCopyWithImpl<$Res>
    implements _$$_GithubRepoDetailCopyWith<$Res> {
  __$$_GithubRepoDetailCopyWithImpl(
      _$_GithubRepoDetail _value, $Res Function(_$_GithubRepoDetail) _then)
      : super(_value, (v) => _then(v as _$_GithubRepoDetail));

  @override
  _$_GithubRepoDetail get _value => super._value as _$_GithubRepoDetail;

  @override
  $Res call({
    Object? html = freezed,
    Object? starred = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_$_GithubRepoDetail(
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

class _$_GithubRepoDetail implements _GithubRepoDetail {
  const _$_GithubRepoDetail(
      {required this.html, required this.starred, required this.fullName});

  @override
  final String html;
  @override
  final bool starred;
  @override
  final String fullName;

  @override
  String toString() {
    return 'GithubRepoDetail(html: $html, starred: $starred, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GithubRepoDetail &&
            const DeepCollectionEquality().equals(other.html, html) &&
            const DeepCollectionEquality().equals(other.starred, starred) &&
            const DeepCollectionEquality().equals(other.fullName, fullName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(html),
      const DeepCollectionEquality().hash(starred),
      const DeepCollectionEquality().hash(fullName));

  @JsonKey(ignore: true)
  @override
  _$$_GithubRepoDetailCopyWith<_$_GithubRepoDetail> get copyWith =>
      __$$_GithubRepoDetailCopyWithImpl<_$_GithubRepoDetail>(this, _$identity);
}

abstract class _GithubRepoDetail implements GithubRepoDetail {
  const factory _GithubRepoDetail(
      {required final String html,
      required final bool starred,
      required final String fullName}) = _$_GithubRepoDetail;

  @override
  String get html => throw _privateConstructorUsedError;
  @override
  bool get starred => throw _privateConstructorUsedError;
  @override
  String get fullName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GithubRepoDetailCopyWith<_$_GithubRepoDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
