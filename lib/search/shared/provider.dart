import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/search/application/search_history_notifier.dart';

import '../../core/shared/provider.dart';
import '../infrastructure/search_history_repository.dart';

final searchHistoryRepositoryProvider =
    Provider((ref) => SearchHistoryRepository(ref.watch(sembastProvider)));

final searchHistoryNotitiferProvider =
    StateNotifierProvider<SearchHistoryNotifier, AsyncValue<List<String>>>(
  (ref) => SearchHistoryNotifier(ref.watch(searchHistoryRepositoryProvider)),
);
