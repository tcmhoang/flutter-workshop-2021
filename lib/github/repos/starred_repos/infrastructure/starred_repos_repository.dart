import 'package:dartz/dartz.dart';
import '../../../../core/infrastructure/network_exception.dart';
import '../../../core/infrastucture/github_repo_dto.dart';
import '../../../../core/infrastructure/fresh.dart';
import '../../../core/domain/github_failure.dart';
import '../../../core/domain/github_repo.dart';
import 'starred_repos_remote_service.dart';

class StarredReposRepository {
  final StarredReposRemoteService _remoteService;
  //TODO: Local service

  StarredReposRepository(this._remoteService);

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getStarredReposPage(
    int page,
  ) async {
    try {
      final remotePageItems = await _remoteService.getStarredReposPage(page);
      return right(
        remotePageItems.when(
          noConnection: (maxPage) => Fresh.no(
            [],
            isNextPageAvailable: page < maxPage,
          ),
          notModified: (maxPage) =>
              Fresh.yes([], isNextPageAvailable: page < maxPage),
          withNewData: (data, maxPage) => Fresh.yes(
            data.toDomain(),
            isNextPageAvailable: page < maxPage,
          ),
        ),
      );
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}

extension DTOListToDomainList on List<GithubRepoDTO> {
  List<GithubRepo> toDomain() => map((e) => e.toDomain()).toList();
}
