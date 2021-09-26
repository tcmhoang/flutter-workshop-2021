import 'package:collection/collection.dart';
import '../../../../core/infrastructure/sembast_database.dart';
import '../../../core/infrastucture/github_repo_dto.dart';
import '../../../core/infrastucture/pagination_config.dart';
import 'package:sembast/sembast.dart';

class StarredReposLocalService {
  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('starredRepos');

  StarredReposLocalService(this._sembastDatabase);

  Future<void> upsertPage(List<GithubRepoDTO> dtos, int page) async {
    final sembastPage = page - 1;

    await _store
        .records(
          dtos.mapIndexed(
            (index, _) => index + PagninationConfig.itemsPerPage * sembastPage,
          ),
        )
        .put(_sembastDatabase.instance, dtos.map((e) => e.toJson()).toList());
  }

  Future<List<GithubRepoDTO>> getPages(int page) async {
    final sembastPage = page - 1;
    final records = await _store.find(
      _sembastDatabase.instance,
      finder: Finder(
        limit: PagninationConfig.itemsPerPage,
        offset: sembastPage * PagninationConfig.itemsPerPage,
      ),
    );
    return records.map((e) => GithubRepoDTO.fromJson(e.value)).toList();
  }
}
