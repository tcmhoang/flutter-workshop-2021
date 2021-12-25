import 'package:dio/dio.dart';
import 'package:repo_viewer/github/core/infrastructure/github_header_cache.dart';
import 'package:repo_viewer/github/core/infrastructure/github_headers.dart';
import 'package:repo_viewer/github/core/infrastructure/github_repo_dto.dart';
import 'package:repo_viewer/github/core/infrastructure/pagination_config.dart';
import 'package:repo_viewer/github/repos/core/infrastructure/repos_remote_service.dart';

import '../../../../core/infrastructure/dio_extensions.dart';
import '../../../../core/infrastructure/network_exception.dart';
import '../../../../core/infrastructure/remote_response.dart';

class SearchReposRemoteService extends ReposRemoveService {
  SearchReposRemoteService(Dio dio, GithubHeaderCache headerCache)
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
        dataSelector: (json) => json.items as List<dynamic>,
      );
}
