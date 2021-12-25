import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/github/repos/core/application/paginated_repos_notifier.dart';

import '../../../../core/infrastructure/fresh.dart';
import '../../../core/domain/github_failure.dart';
import '../../../core/domain/github_repo.dart';
import '../../../core/infrastructure/pagination_config.dart';
import '../infrastructure/starred_repos_repository.dart';

class StarredReposNotifier extends PaginatedReposNotifier {
  final StarredReposRepository _repository;

  StarredReposNotifier(this._repository);

  Future<void> getNextStarredReposPage() =>
      getNextPage((page) => _repository.getStarredReposPage(page));
}
