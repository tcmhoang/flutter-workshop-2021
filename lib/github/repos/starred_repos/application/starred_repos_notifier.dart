import '../../core/application/paginated_repos_notifier.dart';
import '../infrastructure/starred_repos_repository.dart';

class StarredReposNotifier extends PaginatedReposNotifier {
  final StarredReposRepository _repository;

  StarredReposNotifier(this._repository);

  Future<void> getNextStarredReposPage() =>
      getNextPage((page) => _repository.getStarredReposPage(page));

  Future<void> getFirstStarredReposPage() async {
    resetState();
    getNextStarredReposPage();
  }
}
