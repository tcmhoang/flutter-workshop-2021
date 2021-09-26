import 'package:dio/dio.dart';

import '../application/auth_notifer.dart';
import 'github_authenticator.dart';

class OAuth2Interceptor extends Interceptor {
  final GithubAuthenticator _authenticator;
  final AuthNotifier _authNotifier;
  final Dio _dio;

  OAuth2Interceptor(this._authenticator, this._authNotifier, this._dio);
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final credentials = await _authenticator.getSignedInCredentials();
    final modifiedOpts = options
      ..headers.addAll(
        credentials == null
            ? {}
            : {'Authorization': 'bearer ${credentials.accessToken}'},
      );
    handler.next(modifiedOpts);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final errResponse = err.response;
    if (errResponse != null && errResponse.statusCode == 401) {
      final credentials = await _authenticator.getSignedInCredentials();
      credentials != null && credentials.canRefresh
          ? await _authenticator.refresh(credentials)
          : await _authenticator.clearCredentialsStorage();
      await _authNotifier.checkAndUpdateAuthStatus();

      final refreshedCredentials =
          await _authenticator.getSignedInCredentials();
      if (refreshedCredentials != null) {
        handler.resolve(
          await _dio.fetch(
            errResponse.requestOptions
              ..headers['Authorization'] =
                  'bearer ${refreshedCredentials.accessToken}',
          ),
        );
      } else {
        handler.next(err);
      }
    }
  }
}
