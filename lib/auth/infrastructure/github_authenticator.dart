import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart';
import 'package:repo_viewer/auth/domain/auth_failure.dart';
import 'package:repo_viewer/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:repo_viewer/core/infrastructure/dio_extensions.dart';
import 'package:repo_viewer/core/shared/encoder.dart';

class GithubOAuthHttpClient extends http.BaseClient {
  final httpClient = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return http.Client().send(request);
  }
}

class GithubAuthenticator {
  static const clientId = '';

  static const clientSecret = '';

  static const scopes = ['read:user', 'repo'];

  static final authorizationEndPoint =
      Uri.parse('https://github.com/login/oauth/authorize');

  static final tokenEndpoint =
      Uri.parse('https://api.github.com/applications/$clientId/token');

  static final redirectUrl = Uri.parse('http://localhost:3000/callback');

  static final revocationEndpoint =
      Uri.parse('/applications/{client_id}/token');

  final CredentialsStorage _credentialsStorage;
  final Dio _dio;

  GithubAuthenticator(this._credentialsStorage, this._dio);

  Future<Credentials?> getSignedInCredentials() async {
    try {
      final storedCredentials = await _credentialsStorage.read();
      if (storedCredentials != null) {
        if (storedCredentials.canRefresh && storedCredentials.isExpired) {
          return (await refresh(storedCredentials)).fold((l) => null, (r) => r);
        }
      }
      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }

  Future<bool> isSignedIn() =>
      getSignedInCredentials().then((credentials) => credentials != null);

  AuthorizationCodeGrant createGrant() => AuthorizationCodeGrant(
        clientId,
        authorizationEndPoint,
        tokenEndpoint,
        secret: clientSecret,
        httpClient: GithubOAuthHttpClient(),
      );

  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) =>
      grant.getAuthorizationUrl(redirectUrl, scopes: scopes);

  Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
    AuthorizationCodeGrant grant,
    Map<String, String> queriesParams,
  ) async {
    try {
      final httpClient = await grant.handleAuthorizationResponse(queriesParams);
      await _credentialsStorage.save(httpClient.credentials);
      return right(unit);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      try {
        _dio.deleteUri(
          revocationEndpoint,
          data: {
            'access_token': (await _credentialsStorage.read())?.accessToken,
          },
          options: Options(
            headers: {
              'Authorization':
                  'Basic ${stringToBase64.encode('$clientId:$clientSecret')}'
            },
          ),
        );
      } on DioError catch (e) {
        if (e.isNoConnectionError) {
          // Ignoring
        } else {
          rethrow;
        }
      }
      await _credentialsStorage.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Credentials>> refresh(
    Credentials credentials,
  ) async {
    try {
      final refreshedCredential = await credentials.refresh(
        httpClient: GithubOAuthHttpClient(),
        identifier: clientId,
        secret: clientSecret,
      );
      await _credentialsStorage.save(refreshedCredential);
      return right(refreshedCredential);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }
}
