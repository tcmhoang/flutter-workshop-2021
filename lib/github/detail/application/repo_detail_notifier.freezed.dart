// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repo_detail_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RepoDetailState {
  bool get isStarredStatusChange => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStarredStatusChange) initial,
    required TResult Function(bool isStarredStatusChange) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)
        loadSuccess,
    required TResult Function(GithubFailure failure, bool isStarredStatusChange)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStarredStatusChange)? initial,
    TResult Function(bool isStarredStatusChange)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool isStarredStatusChange)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStarredStatusChange)? initial,
    TResult Function(bool isStarredStatusChange)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool isStarredStatusChange)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepoDetailStateCopyWith<RepoDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoDetailStateCopyWith<$Res> {
  factory $RepoDetailStateCopyWith(
          RepoDetailState value, $Res Function(RepoDetailState) then) =
      _$RepoDetailStateCopyWithImpl<$Res>;
  $Res call({bool isStarredStatusChange});
}

/// @nodoc
class _$RepoDetailStateCopyWithImpl<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  _$RepoDetailStateCopyWithImpl(this._value, this._then);

  final RepoDetailState _value;
  // ignore: unused_field
  final $Res Function(RepoDetailState) _then;

  @override
  $Res call({
    Object? isStarredStatusChange = freezed,
  }) {
    return _then(_value.copyWith(
      isStarredStatusChange: isStarredStatusChange == freezed
          ? _value.isStarredStatusChange
          : isStarredStatusChange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({bool isStarredStatusChange});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$RepoDetailStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? isStarredStatusChange = freezed,
  }) {
    return _then(_$_Initial(
      isStarredStatusChange: isStarredStatusChange == freezed
          ? _value.isStarredStatusChange
          : isStarredStatusChange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({this.isStarredStatusChange = false});

  @override
  @JsonKey()
  final bool isStarredStatusChange;

  @override
  String toString() {
    return 'RepoDetailState.initial(isStarredStatusChange: $isStarredStatusChange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other.isStarredStatusChange, isStarredStatusChange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isStarredStatusChange));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStarredStatusChange) initial,
    required TResult Function(bool isStarredStatusChange) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)
        loadSuccess,
    required TResult Function(GithubFailure failure, bool isStarredStatusChange)
        failure,
  }) {
    return initial(isStarredStatusChange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStarredStatusChange)? initial,
    TResult Function(bool isStarredStatusChange)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool isStarredStatusChange)?
        failure,
  }) {
    return initial?.call(isStarredStatusChange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStarredStatusChange)? initial,
    TResult Function(bool isStarredStatusChange)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool isStarredStatusChange)?
        failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isStarredStatusChange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RepoDetailState {
  const factory _Initial({final bool isStarredStatusChange}) = _$_Initial;

  @override
  bool get isStarredStatusChange => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadInProgressCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$_LoadInProgressCopyWith(
          _$_LoadInProgress value, $Res Function(_$_LoadInProgress) then) =
      __$$_LoadInProgressCopyWithImpl<$Res>;
  @override
  $Res call({bool isStarredStatusChange});
}

/// @nodoc
class __$$_LoadInProgressCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res>
    implements _$$_LoadInProgressCopyWith<$Res> {
  __$$_LoadInProgressCopyWithImpl(
      _$_LoadInProgress _value, $Res Function(_$_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _$_LoadInProgress));

  @override
  _$_LoadInProgress get _value => super._value as _$_LoadInProgress;

  @override
  $Res call({
    Object? isStarredStatusChange = freezed,
  }) {
    return _then(_$_LoadInProgress(
      isStarredStatusChange: isStarredStatusChange == freezed
          ? _value.isStarredStatusChange
          : isStarredStatusChange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress({this.isStarredStatusChange = false});

  @override
  @JsonKey()
  final bool isStarredStatusChange;

  @override
  String toString() {
    return 'RepoDetailState.loadInProgress(isStarredStatusChange: $isStarredStatusChange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadInProgress &&
            const DeepCollectionEquality()
                .equals(other.isStarredStatusChange, isStarredStatusChange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isStarredStatusChange));

  @JsonKey(ignore: true)
  @override
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      __$$_LoadInProgressCopyWithImpl<_$_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStarredStatusChange) initial,
    required TResult Function(bool isStarredStatusChange) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)
        loadSuccess,
    required TResult Function(GithubFailure failure, bool isStarredStatusChange)
        failure,
  }) {
    return loadInProgress(isStarredStatusChange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStarredStatusChange)? initial,
    TResult Function(bool isStarredStatusChange)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool isStarredStatusChange)?
        failure,
  }) {
    return loadInProgress?.call(isStarredStatusChange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStarredStatusChange)? initial,
    TResult Function(bool isStarredStatusChange)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool isStarredStatusChange)?
        failure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(isStarredStatusChange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements RepoDetailState {
  const factory _LoadInProgress({final bool isStarredStatusChange}) =
      _$_LoadInProgress;

  @override
  bool get isStarredStatusChange => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadSuccessCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$_LoadSuccessCopyWith(
          _$_LoadSuccess value, $Res Function(_$_LoadSuccess) then) =
      __$$_LoadSuccessCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange});

  $FreshCopyWith<GithubRepoDetail?, $Res> get repoDetails;
}

/// @nodoc
class __$$_LoadSuccessCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res>
    implements _$$_LoadSuccessCopyWith<$Res> {
  __$$_LoadSuccessCopyWithImpl(
      _$_LoadSuccess _value, $Res Function(_$_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _$_LoadSuccess));

  @override
  _$_LoadSuccess get _value => super._value as _$_LoadSuccess;

  @override
  $Res call({
    Object? repoDetails = freezed,
    Object? isStarredStatusChange = freezed,
  }) {
    return _then(_$_LoadSuccess(
      repoDetails == freezed
          ? _value.repoDetails
          : repoDetails // ignore: cast_nullable_to_non_nullable
              as Fresh<GithubRepoDetail?>,
      isStarredStatusChange: isStarredStatusChange == freezed
          ? _value.isStarredStatusChange
          : isStarredStatusChange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $FreshCopyWith<GithubRepoDetail?, $Res> get repoDetails {
    return $FreshCopyWith<GithubRepoDetail?, $Res>(_value.repoDetails, (value) {
      return _then(_value.copyWith(repoDetails: value));
    });
  }
}

/// @nodoc

class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.repoDetails, {this.isStarredStatusChange = false});

  @override
  final Fresh<GithubRepoDetail?> repoDetails;
  @override
  @JsonKey()
  final bool isStarredStatusChange;

  @override
  String toString() {
    return 'RepoDetailState.loadSuccess(repoDetails: $repoDetails, isStarredStatusChange: $isStarredStatusChange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSuccess &&
            const DeepCollectionEquality()
                .equals(other.repoDetails, repoDetails) &&
            const DeepCollectionEquality()
                .equals(other.isStarredStatusChange, isStarredStatusChange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(repoDetails),
      const DeepCollectionEquality().hash(isStarredStatusChange));

  @JsonKey(ignore: true)
  @override
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      __$$_LoadSuccessCopyWithImpl<_$_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStarredStatusChange) initial,
    required TResult Function(bool isStarredStatusChange) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)
        loadSuccess,
    required TResult Function(GithubFailure failure, bool isStarredStatusChange)
        failure,
  }) {
    return loadSuccess(repoDetails, isStarredStatusChange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStarredStatusChange)? initial,
    TResult Function(bool isStarredStatusChange)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool isStarredStatusChange)?
        failure,
  }) {
    return loadSuccess?.call(repoDetails, isStarredStatusChange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStarredStatusChange)? initial,
    TResult Function(bool isStarredStatusChange)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool isStarredStatusChange)?
        failure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(repoDetails, isStarredStatusChange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements RepoDetailState {
  const factory _LoadSuccess(final Fresh<GithubRepoDetail?> repoDetails,
      {final bool isStarredStatusChange}) = _$_LoadSuccess;

  Fresh<GithubRepoDetail?> get repoDetails =>
      throw _privateConstructorUsedError;
  @override
  bool get isStarredStatusChange => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @override
  $Res call({GithubFailure failure, bool isStarredStatusChange});

  $GithubFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res> extends _$RepoDetailStateCopyWithImpl<$Res>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, (v) => _then(v as _$_Failure));

  @override
  _$_Failure get _value => super._value as _$_Failure;

  @override
  $Res call({
    Object? failure = freezed,
    Object? isStarredStatusChange = freezed,
  }) {
    return _then(_$_Failure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
      isStarredStatusChange: isStarredStatusChange == freezed
          ? _value.isStarredStatusChange
          : isStarredStatusChange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $GithubFailureCopyWith<$Res> get failure {
    return $GithubFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure(this.failure, {this.isStarredStatusChange = false});

  @override
  final GithubFailure failure;
  @override
  @JsonKey()
  final bool isStarredStatusChange;

  @override
  String toString() {
    return 'RepoDetailState.failure(failure: $failure, isStarredStatusChange: $isStarredStatusChange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            const DeepCollectionEquality()
                .equals(other.isStarredStatusChange, isStarredStatusChange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(isStarredStatusChange));

  @JsonKey(ignore: true)
  @override
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStarredStatusChange) initial,
    required TResult Function(bool isStarredStatusChange) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)
        loadSuccess,
    required TResult Function(GithubFailure failure, bool isStarredStatusChange)
        failure,
  }) {
    return failure(this.failure, isStarredStatusChange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStarredStatusChange)? initial,
    TResult Function(bool isStarredStatusChange)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool isStarredStatusChange)?
        failure,
  }) {
    return failure?.call(this.failure, isStarredStatusChange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStarredStatusChange)? initial,
    TResult Function(bool isStarredStatusChange)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetails, bool isStarredStatusChange)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool isStarredStatusChange)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure, isStarredStatusChange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements RepoDetailState {
  const factory _Failure(final GithubFailure failure,
      {final bool isStarredStatusChange}) = _$_Failure;

  GithubFailure get failure => throw _privateConstructorUsedError;
  @override
  bool get isStarredStatusChange => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
