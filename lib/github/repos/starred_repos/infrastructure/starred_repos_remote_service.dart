import 'package:dio/dio.dart';

import '../../../../core/infrastructure/dio_extensions.dart';
import '../../../../core/infrastructure/network_exception.dart';
import '../../../../core/infrastructure/remote_response.dart';
import '../../../core/infrastucture/github_header_cache.dart';
import '../../../core/infrastucture/github_headers.dart';
import '../../../core/infrastucture/github_repo_dto.dart';
import '../../../core/infrastucture/pagination_config.dart';

class StarredReposRemoteService {
  final Dio _dio;
  final GithubHeaderCache _headerCache;

  StarredReposRemoteService(this._dio, this._headerCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
    int page,
  ) async {
    const token = '';
    const accept = 'application/vnd.github.v3.html+json';
    final requestUri = Uri.https(
      'api.github.com',
      '/user/starred',
      {
        'page': '$page',
        'per_page': PagninationConfig.itemsPerPage.toString(),
      },
    );

    final previousHeader = await _headerCache.getHeaders(requestUri);

    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          headers: {
            'Authorization': 'bearer $token',
            'Accept': accept,
            'If-None_Match': previousHeader?.etag ?? '',
          },
        ),
      );
      if (response.statusCode == 304) {
        return RemoteResponse.notModified(
          maxPage: previousHeader?.link?.maxPage ?? 0,
        );
      } else if (response.statusCode == 200) {
        final headers = GithubHeaders.parse(response);
        await _headerCache.saveHeaders(
          requestUri,
          headers,
        );

        final convertedData = (response.data as List<dynamic>)
            .map((e) => GithubRepoDTO.fromJson(e as Map<String, dynamic>))
            .toList();

        return RemoteResponse.withNewData(
          convertedData,
          maxPage: headers.link?.maxPage ?? 1,
        );
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return RemoteResponse.noConnection(
          maxPage: previousHeader?.link?.maxPage ?? 0,
        );
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
