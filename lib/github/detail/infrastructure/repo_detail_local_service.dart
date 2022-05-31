import 'package:repo_viewer/core/infrastructure/sembast_database.dart';
import 'package:repo_viewer/github/detail/infrastructure/github_repo_detail_dto.dart';
import 'package:sembast/sembast.dart';

class RepoDetailLocalService {
  static const kCacheSize = 50;
  final SembastDatabase _sembastDatabase;
  final _store = stringMapStoreFactory.store('repoDetails');

  RepoDetailLocalService(this._sembastDatabase);

  Future<void> upsearchRepoDetail(
    GithubRepoDetailDto githubRepoDetailDto,
  ) async {
    await _store.record(githubRepoDetailDto.fullName).put(
          _sembastDatabase.instance,
          githubRepoDetailDto.toSembast(),
        );
  }

  Future<GithubRepoDetailDto?> getRepoDetail(String fullRepoName) async {
    return _store
        .record(fullRepoName)
        .getSnapshot(_sembastDatabase.instance)
        .then(
          (snapshot) => snapshot != null
              ? GithubRepoDetailDto.fromSembast(snapshot)
              : null,
        );
  }
}
