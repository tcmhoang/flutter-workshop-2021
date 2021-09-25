import 'package:sembast/sembast.dart';

import '../../../core/infrastructure/sembast_database.dart';
import 'github_headers.dart';

class GithubHeaderCache {
  final SembastDatabase _sembastDatabase;
  final _store = stringMapStoreFactory.store('headers');

  GithubHeaderCache(this._sembastDatabase);

  Future<void> saveHeaders(Uri uri, GithubHeaders headers) async => _store
      .record(uri.toString())
      .put(_sembastDatabase.instance, headers.toJson());

  Future<GithubHeaders?> getHeaders(Uri uri) async {
    final json = await _store.record(uri.toString()).get(
          _sembastDatabase.instance,
        );
    return json == null ? null : GithubHeaders.fromJson(json);
  }

  Future<void> deleteHeaders(Uri uri) async =>
      _store.record(uri.toString()).delete(
            _sembastDatabase.instance,
          );
}
