import 'package:dartz/dartz.dart';
import 'package:repo_viewer/core/infrastructure/fresh.dart';
import 'package:repo_viewer/core/infrastructure/network_exception.dart';
import 'package:repo_viewer/github/core/domain/github_failure.dart';
import 'package:repo_viewer/github/detail/domain/github_repo_detail.dart';
import 'package:repo_viewer/github/detail/infrastructure/github_repo_detail_dto.dart';
import 'package:repo_viewer/github/detail/infrastructure/repo_detail_local_service.dart';
import 'package:repo_viewer/github/detail/infrastructure/repo_detail_remote_service.dart';

class RepoDetailRepostory {
  final RepoDetailLocalService _repoDetailLocalService;
  final RepoDetailRemoteService _repoDetailRemoteService;

  RepoDetailRepostory(
    this._repoDetailLocalService,
    this._repoDetailRemoteService,
  );

  Future<Either<GithubFailure, Unit?>> switchStarredStaus(
    GithubRepoDetail repoDetail,
  ) async {
    try {
      final actionCompleted = await _repoDetailRemoteService.switchStarStatus(
        repoDetail.fullName,
        isStarred: repoDetail.starred,
      );

      return right(actionCompleted);
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }

  Future<Either<GithubFailure, Fresh<GithubRepoDetail?>>> getRepoDetail(
    String fullRepoName,
  ) async {
    try {
      final htmlRemoteResponse =
          await _repoDetailRemoteService.getReadmeHtml(fullRepoName);

      return right(
        await htmlRemoteResponse.when(
          noConnection: () async => Fresh.no(
            await _repoDetailLocalService
                .getRepoDetail(fullRepoName)
                .then((dto) => dto?.toDomain()),
          ),
          notModified: (_) async {
            final cache =
                await _repoDetailLocalService.getRepoDetail(fullRepoName);
            final starred =
                await _repoDetailRemoteService.getStarredStatus(fullRepoName);
            final withUpdatedStarredField =
                cache?.copyWith(starred: starred ?? false);
            return Fresh.yes(withUpdatedStarredField?.toDomain());
          },
          withNewData: (html, _) async {
            final starred =
                await _repoDetailRemoteService.getStarredStatus(fullRepoName);
            final dto = GithubRepoDetailDto(
              html: html,
              starred: starred ?? false,
              fullName: fullRepoName,
            );
            _repoDetailLocalService.upsearchRepoDetail(dto);
            return Fresh.yes(
              dto.toDomain(),
            );
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}
