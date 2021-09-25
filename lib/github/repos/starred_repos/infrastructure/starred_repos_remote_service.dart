import 'package:dio/dio.dart';
import '../../../../core/infrastructure/dio_extensions.dart';
import '../../../../core/infrastructure/network_exception.dart';
import '../../../../core/infrastructure/remote_response.dart';
import '../../../core/infrastucture/github_header_cache.dart';
import '../../../core/infrastucture/github_headers.dart';
import '../../../core/infrastucture/github_repo_dto.dart';

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
      if (response.statusCode == 304) {
        return const RemoteResponse.notModified();
      } else if (response.statusCode == 200) {
        await _headerCache.saveHeaders(
          requestUri,
          GithubHeaders.parse(response),
        );

        final convertedData = (response.data as List<dynamic>)
            .map((e) => GithubRepoDTO.fromJson(e as Map<String, dynamic>))
            .toList();

        return RemoteResponse.withNewData(convertedData);
      } else {
        throw RestApiException(response.statusCode);
      }
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
