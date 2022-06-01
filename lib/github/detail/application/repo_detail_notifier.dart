import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/github/core/domain/github_failure.dart';
import 'package:repo_viewer/github/detail/domain/github_repo_detail.dart';
import 'package:repo_viewer/github/detail/infrastructure/repo_detail_repository.dart';

import '../../../core/infrastructure/fresh.dart';
part 'repo_detail_notifier.freezed.dart';

@freezed
class RepoDetailState with _$RepoDetailState {
  const factory RepoDetailState.initial({
    @Default(false) bool isStarredStatusChange,
  }) = _Initial;

  const factory RepoDetailState.loadInProgress({
    @Default(false) bool isStarredStatusChange,
  }) = _LoadInProgress;

  const factory RepoDetailState.loadSuccess(
    Fresh<GithubRepoDetail?> repoDetails, {
    @Default(false) bool isStarredStatusChange,
  }) = _LoadSuccess;

  const factory RepoDetailState.failure(
    GithubFailure failure, {
    @Default(false) bool isStarredStatusChange,
  }) = _Failure;
}

class RepoDetailNotifer extends StateNotifier<RepoDetailState> {
  final RepoDetailRepostory _repostory;
  RepoDetailNotifer(this._repostory) : super(const RepoDetailState.initial());

  Future<void> getRepoDetail(String fullRepoName) async {
    state = const RepoDetailState.loadInProgress();
    final failureOrRepoDetail = await _repostory.getRepoDetail(fullRepoName);

    state = failureOrRepoDetail.fold(
      (l) => RepoDetailState.failure(l),
      (r) => RepoDetailState.loadSuccess(r),
    );
  }

  Future<void> switchStarredStatus(GithubRepoDetail repoDetail) async {
    state.maybeMap(
      orElse: () {},
      loadSuccess: (successState) async {
        final stateCopy = successState.copyWith();
        final repoDetail = successState.repoDetails.entity;
        if (repoDetail != null) {
          state = successState.copyWith.repoDetails(
            entity: repoDetail.copyWith(starred: !repoDetail.starred),
          );
          final failureOrSuccess =
              await _repostory.switchStarredStaus(repoDetail);
          failureOrSuccess.fold(
            (l) => state = stateCopy,
            (r) => r == null
                ? state = stateCopy
                : state = state.copyWith(isStarredStatusChange: true),
          );
        }
      },
    );
  }
}
