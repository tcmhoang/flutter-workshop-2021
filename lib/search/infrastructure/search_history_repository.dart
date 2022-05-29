import 'dart:async';

import 'package:repo_viewer/core/infrastructure/sembast_database.dart';
import 'package:sembast/sembast.dart';

class SearchHistoryRepository {
  static const kHistoryLength = 10;

  final SembastDatabase _sembastDatabase;
  final _store = StoreRef<int, String>('Search History');

  SearchHistoryRepository(this._sembastDatabase);

  Stream<List<String>> watchSearchTerms({
    String? filterKeyWord,
    String? filter,
  }) {
    return _store
        .query(
          finder: filterKeyWord != null && filterKeyWord.isNotEmpty
              ? Finder(
                  filter: Filter.custom(
                    (record) =>
                        (record.value as String).startsWith(filterKeyWord),
                  ),
                )
              : null,
        )
        .onSnapshots(_sembastDatabase.instance)
        .expand((snapshots) => snapshots.map((e) => e.value))
        .toList()
        .then((value) => value.reversed.toList())
        .asStream();
  }

  Future<void> addSearchTerm(String term) async {
    _addSearchTerm(term, _sembastDatabase.instance);
  }

  Future<void> deleteSearchTerm(String term) async {
    _deleteSearchTerm(term, _sembastDatabase.instance);
  }

  Future<void> putSearchedTermFirst(String term) async {
    _sembastDatabase.instance.transaction(
      (transaction) async {
        await _deleteSearchTerm(term, transaction);
        await _addSearchTerm(term, transaction);
      },
    );
  }

  Future<void> _addSearchTerm(String term, DatabaseClient dbClient) async {
    final eKey = await _store.findKey(
      dbClient,
      finder: Finder(
        filter: Filter.custom((record) => record.value == term),
      ),
    );
    if (eKey != null) {
      putSearchedTermFirst(term);
      return;
    }
    await _store.add(dbClient, term);
    final count = await _store.count(dbClient);
    if (count > kHistoryLength) {
      await _store.delete(
        dbClient,
        finder: Finder(limit: count - kHistoryLength, offset: 0),
      );
    }
  }

  Future<void> _deleteSearchTerm(String term, DatabaseClient dbclient) async {
    await _store.delete(
      dbclient,
      finder: Finder(filter: Filter.custom((record) => record.value == term)),
    );
  }
}
