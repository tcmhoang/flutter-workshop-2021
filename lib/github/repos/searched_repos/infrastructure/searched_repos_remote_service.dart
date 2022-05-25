import 'package:dio/dio.dart';

import '../../../../core/infrastructure/remote_response.dart';
import '../../../core/infrastructure/github_header_cache.dart';
import '../../../core/infrastructure/github_repo_dto.dart';
import '../../../core/infrastructure/pagination_config.dart';
import '../../core/infrastructure/repos_remote_service.dart';

class SearchedReposRemoteService extends ReposRemoteService {
  SearchedReposRemoteService(Dio dio, GithubHeaderCache headerCache)
      : super(dio, headerCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getSearchReposPage(
    String query,
    int page,
  ) async =>
      getPage(
        requestUri: Uri.https(
          'api.github.com',
          '/search/repositories',
          {
            'q': query,
            'page': '$page',
            'per_page': PaginationConfig.itemsPerPage.toString(),
          },
        ),
        // ignore: avoid_dynamic_calls
        dataSelector: (json) => json.items as List<dynamic>,
      );
}
