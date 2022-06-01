import 'package:repo_viewer/core/infrastructure/sembast_database.dart';
import 'package:repo_viewer/github/core/infrastructure/github_header_cache.dart';
import 'package:repo_viewer/github/detail/infrastructure/github_repo_detail_dto.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/timestamp.dart';

class RepoDetailLocalService {
  static const kLastUsedFieldName = 'lastUsed';
  static const kCacheSize = 50;

  final SembastDatabase _sembastDatabase;
  final GithubHeaderCache _headerCache;
  final _store = stringMapStoreFactory.store('repoDetails');

  RepoDetailLocalService(this._sembastDatabase, this._headerCache);

  Future<void> upsearchRepoDetail(
    GithubRepoDetailDto githubRepoDetailDto,
  ) async {
    await _store.record(githubRepoDetailDto.fullName).put(
          _sembastDatabase.instance,
          githubRepoDetailDto.toJson()
            ..addAll({kLastUsedFieldName: Timestamp.now()}),
        );

    final keys = await _store.findKeys(
      _sembastDatabase.instance,
      finder: Finder(sortOrders: [SortOrder(kLastUsedFieldName, false)]),
    );

    if (keys.length > kCacheSize) {
      final keysToRemove = keys.sublist(kCacheSize);
      await Future.forEach<String>(
        keysToRemove,
        (key) => _store.record(key).delete(_sembastDatabase.instance).then(
              (_) => _headerCache.deleteHeaders(
                Uri.https('api.github.com', '/repos/$key/readme'),
              ),
            ),
      );
    }
  }

  Future<GithubRepoDetailDto?> getRepoDetail(String fullRepoName) async {
    final recordRef = _store.record(fullRepoName);
    recordRef.update(
      _sembastDatabase.instance,
      {kLastUsedFieldName: Timestamp.now()},
    );
    return recordRef.getSnapshot(_sembastDatabase.instance).then(
          (snapshot) => snapshot != null
              ? GithubRepoDetailDto.fromSembast(snapshot)
              : null,
        );
  }
}
