import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:repo_viewer/core/infrastructure/dio_extensions.dart';
import 'package:repo_viewer/core/infrastructure/network_exception.dart';
import 'package:repo_viewer/core/infrastructure/remote_response.dart';
import 'package:repo_viewer/github/core/infrastructure/github_header_cache.dart';
import 'package:repo_viewer/github/core/infrastructure/github_headers.dart';

class RepoDetailRemoteService {
  final Dio _dio;
  final GithubHeaderCache _headerCache;

  RepoDetailRemoteService(
    this._dio,
    this._headerCache,
  );

  Future<RemoteResponse<String>> getReadmeHtml(String fullRepoName) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/repos/$fullRepoName/readme',
    );
    final prevHeader = await _headerCache.getHeaders(requestUri);

    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          headers: {
            'If-None-Match': prevHeader?.etag ?? '',
          },
          responseType: ResponseType.plain,
        ),
      );

      if (response.statusCode == 304) {
        return const RemoteResponse.notModified(maxPage: 0);
      } else if (response.statusCode == 200) {
        final headers = GithubHeaders.parse(response);

        await _headerCache.saveHeaders(requestUri, headers);
        final html = response.data as String;
        return RemoteResponse.withNewData(html, maxPage: 0);
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

  // Return `null` if theres no internet connection
  Future<bool?> getStarredStatus(String fullRepoName) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/user/starred/$fullRepoName',
    );
    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          validateStatus: (status) =>
              (status != null && status >= 200 && status < 400) ||
              status == 400,
        ),
      );
      if (response.statusCode == 204) {
        return true;
      } else if (response.statusCode == 404) {
        return false;
      }
      throw RestApiException(response.statusCode);
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return null;
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }

  Future<Unit?> switchStarStatus(
    String fullRepoName, {
    required bool isStarred,
  }) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/user/starred/$fullRepoName',
    );

    try {
      final response = await (isStarred
          ? _dio.deleteUri(requestUri)
          : _dio.putUri(requestUri));
      if (response.statusCode == 204) {
        return unit;
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return null;
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
