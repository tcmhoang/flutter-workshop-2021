import 'package:dio/dio.dart';

import '../../../../core/infrastructure/dio_extensions.dart';
import '../../../../core/infrastructure/network_exception.dart';
import '../../../../core/infrastructure/remote_response.dart';
import '../../../core/infrastructure/github_header_cache.dart';
import '../../../core/infrastructure/github_headers.dart';
import '../../../core/infrastructure/github_repo_dto.dart';

abstract class ReposRemoteService {
  final Dio _dio;
  final GithubHeaderCache _headerCache;

  ReposRemoteService(this._dio, this._headerCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getPage({
    required Uri requestUri,
    required List<dynamic> Function(dynamic json) dataSelector,
  }) async {
    final previousHeader = await _headerCache.getHeaders(requestUri);

    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          headers: {
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

        final convertedData = (dataSelector(response.data))
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
        return const RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
