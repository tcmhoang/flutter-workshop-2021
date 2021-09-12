// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_header.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GithubHeaderTearOff {
  const _$GithubHeaderTearOff();

  _GithubHeader call({String? etag, PaginationLink? link}) {
    return _GithubHeader(
      etag: etag,
      link: link,
    );
  }
}

/// @nodoc
const $GithubHeader = _$GithubHeaderTearOff();

/// @nodoc
mixin _$GithubHeader {
  String? get etag => throw _privateConstructorUsedError;
  PaginationLink? get link => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GithubHeaderCopyWith<GithubHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubHeaderCopyWith<$Res> {
  factory $GithubHeaderCopyWith(
          GithubHeader value, $Res Function(GithubHeader) then) =
      _$GithubHeaderCopyWithImpl<$Res>;
  $Res call({String? etag, PaginationLink? link});

  $PaginationLinkCopyWith<$Res>? get link;
}

/// @nodoc
class _$GithubHeaderCopyWithImpl<$Res> implements $GithubHeaderCopyWith<$Res> {
  _$GithubHeaderCopyWithImpl(this._value, this._then);

  final GithubHeader _value;
  // ignore: unused_field
  final $Res Function(GithubHeader) _then;

  @override
  $Res call({
    Object? etag = freezed,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      etag: etag == freezed
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as PaginationLink?,
    ));
  }

  @override
  $PaginationLinkCopyWith<$Res>? get link {
    if (_value.link == null) {
      return null;
    }

    return $PaginationLinkCopyWith<$Res>(_value.link!, (value) {
      return _then(_value.copyWith(link: value));
    });
  }
}

/// @nodoc
abstract class _$GithubHeaderCopyWith<$Res>
    implements $GithubHeaderCopyWith<$Res> {
  factory _$GithubHeaderCopyWith(
          _GithubHeader value, $Res Function(_GithubHeader) then) =
      __$GithubHeaderCopyWithImpl<$Res>;
  @override
  $Res call({String? etag, PaginationLink? link});

  @override
  $PaginationLinkCopyWith<$Res>? get link;
}

/// @nodoc
class __$GithubHeaderCopyWithImpl<$Res> extends _$GithubHeaderCopyWithImpl<$Res>
    implements _$GithubHeaderCopyWith<$Res> {
  __$GithubHeaderCopyWithImpl(
      _GithubHeader _value, $Res Function(_GithubHeader) _then)
      : super(_value, (v) => _then(v as _GithubHeader));

  @override
  _GithubHeader get _value => super._value as _GithubHeader;

  @override
  $Res call({
    Object? etag = freezed,
    Object? link = freezed,
  }) {
    return _then(_GithubHeader(
      etag: etag == freezed
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as PaginationLink?,
    ));
  }
}

/// @nodoc

class _$_GithubHeader extends _GithubHeader with DiagnosticableTreeMixin {
  const _$_GithubHeader({this.etag, this.link}) : super._();

  @override
  final String? etag;
  @override
  final PaginationLink? link;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GithubHeader(etag: $etag, link: $link)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GithubHeader'))
      ..add(DiagnosticsProperty('etag', etag))
      ..add(DiagnosticsProperty('link', link));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GithubHeader &&
            (identical(other.etag, etag) ||
                const DeepCollectionEquality().equals(other.etag, etag)) &&
            (identical(other.link, link) ||
                const DeepCollectionEquality().equals(other.link, link)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(etag) ^
      const DeepCollectionEquality().hash(link);

  @JsonKey(ignore: true)
  @override
  _$GithubHeaderCopyWith<_GithubHeader> get copyWith =>
      __$GithubHeaderCopyWithImpl<_GithubHeader>(this, _$identity);
}

abstract class _GithubHeader extends GithubHeader {
  const factory _GithubHeader({String? etag, PaginationLink? link}) =
      _$_GithubHeader;
  const _GithubHeader._() : super._();

  @override
  String? get etag => throw _privateConstructorUsedError;
  @override
  PaginationLink? get link => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GithubHeaderCopyWith<_GithubHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$PaginationLinkTearOff {
  const _$PaginationLinkTearOff();

  _PaginationLink call({required int maxPage}) {
    return _PaginationLink(
      maxPage: maxPage,
    );
  }
}

/// @nodoc
const $PaginationLink = _$PaginationLinkTearOff();

/// @nodoc
mixin _$PaginationLink {
  int get maxPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationLinkCopyWith<PaginationLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationLinkCopyWith<$Res> {
  factory $PaginationLinkCopyWith(
          PaginationLink value, $Res Function(PaginationLink) then) =
      _$PaginationLinkCopyWithImpl<$Res>;
  $Res call({int maxPage});
}

/// @nodoc
class _$PaginationLinkCopyWithImpl<$Res>
    implements $PaginationLinkCopyWith<$Res> {
  _$PaginationLinkCopyWithImpl(this._value, this._then);

  final PaginationLink _value;
  // ignore: unused_field
  final $Res Function(PaginationLink) _then;

  @override
  $Res call({
    Object? maxPage = freezed,
  }) {
    return _then(_value.copyWith(
      maxPage: maxPage == freezed
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PaginationLinkCopyWith<$Res>
    implements $PaginationLinkCopyWith<$Res> {
  factory _$PaginationLinkCopyWith(
          _PaginationLink value, $Res Function(_PaginationLink) then) =
      __$PaginationLinkCopyWithImpl<$Res>;
  @override
  $Res call({int maxPage});
}

/// @nodoc
class __$PaginationLinkCopyWithImpl<$Res>
    extends _$PaginationLinkCopyWithImpl<$Res>
    implements _$PaginationLinkCopyWith<$Res> {
  __$PaginationLinkCopyWithImpl(
      _PaginationLink _value, $Res Function(_PaginationLink) _then)
      : super(_value, (v) => _then(v as _PaginationLink));

  @override
  _PaginationLink get _value => super._value as _PaginationLink;

  @override
  $Res call({
    Object? maxPage = freezed,
  }) {
    return _then(_PaginationLink(
      maxPage: maxPage == freezed
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PaginationLink extends _PaginationLink with DiagnosticableTreeMixin {
  const _$_PaginationLink({required this.maxPage}) : super._();

  @override
  final int maxPage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginationLink(maxPage: $maxPage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaginationLink'))
      ..add(DiagnosticsProperty('maxPage', maxPage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaginationLink &&
            (identical(other.maxPage, maxPage) ||
                const DeepCollectionEquality().equals(other.maxPage, maxPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(maxPage);

  @JsonKey(ignore: true)
  @override
  _$PaginationLinkCopyWith<_PaginationLink> get copyWith =>
      __$PaginationLinkCopyWithImpl<_PaginationLink>(this, _$identity);
}

abstract class _PaginationLink extends PaginationLink {
  const factory _PaginationLink({required int maxPage}) = _$_PaginationLink;
  const _PaginationLink._() : super._();

  @override
  int get maxPage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaginationLinkCopyWith<_PaginationLink> get copyWith =>
      throw _privateConstructorUsedError;
}
