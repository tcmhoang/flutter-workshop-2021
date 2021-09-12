import 'package:dio/dio.dart';
import 'package:repo_viewer/core/infrastructure/network_exception.dart';
import 'package:repo_viewer/core/infrastructure/remote_response.dart';
import 'package:repo_viewer/github/core/infrastucture/github_header_cache.dart';
import 'package:repo_viewer/github/core/infrastucture/github_repo_dto.dart';
import 'package:repo_viewer/core/infrastructure/dio_extensions.dart';

class StarredReposRemoteService {
  final Dio _dio;
  final GithubHeaderCache _headerCache;

  StarredReposRemoteService(this._dio, this._headerCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
    int page,
  ) async {
    const token = '';
    const accept = 'vnd.github.v3.html+json';
    final requestUri = Uri.https(
      'api.github.com',
      '/user/starred',
      {'page': '$page'},
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
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return const RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
