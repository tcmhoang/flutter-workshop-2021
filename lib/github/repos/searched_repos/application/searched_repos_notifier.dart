import '../../core/application/paginated_repos_notifier.dart';
import '../infrastructure/searched_repos_repository.dart';

class SearchedReposNotifier extends PaginatedReposNotifier {
  final SearchedReposRepository _repository;

  SearchedReposNotifier(this._repository);

  Future<void> getNextSearchedReposPage(String query) =>
      getNextPage((page) => _repository.getSearchedReposPage(query, page));

  Future<void> getFirstReposPage(String query) async {
    resetState();
    getNextSearchedReposPage(query);
  }
}
