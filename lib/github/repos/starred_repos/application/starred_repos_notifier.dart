import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/infrastructure/fresh.dart';
import '../../../core/domain/github_failure.dart';
import '../../../core/domain/github_repo.dart';
import '../../../core/infrastructure/pagination_config.dart';
import '../infrastructure/starred_repos_repository.dart';

part 'starred_repos_notifier.freezed.dart';

@freezed
class StarredReposState with _$StarredReposState {
  const StarredReposState._();
  const factory StarredReposState.initial(Fresh<List<GithubRepo>> repos) =
      _Initial;
  const factory StarredReposState.loadInProgress(
    Fresh<List<GithubRepo>> repos,
    int itemPerPage,
  ) = _LoadInProgress;
  const factory StarredReposState.loadSuccess(
    Fresh<List<GithubRepo>> repos, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;

  const factory StarredReposState.loadFailure(
    Fresh<List<GithubRepo>> repos,
    GithubFailure failure,
  ) = _LoadFailure;
}

class StarredReposNotifier extends StateNotifier<StarredReposState> {
  final StarredReposRepository _repository;
  int _page = 1;

  StarredReposNotifier(this._repository)
      : super(StarredReposState.initial(Fresh.yes([])));

  Future<void> getNextStarredReposPage() async {
    final pages = state.repos;
    state = StarredReposState.loadInProgress(
      pages,
      PaginationConfig.itemsPerPage,
    );
    final newlyPages = await _repository.getStarredReposPage(_page);
    state =
        newlyPages.fold((l) => StarredReposState.loadFailure(pages, l), (r) {
      _page++;
      return StarredReposState.loadSuccess(
        r.copyWith(
          entity: [
            ...pages.entity,
            ...r.entity,
          ],
        ),
        isNextPageAvailable: r.isNextPageAvailable ?? false,
      );
    });
  }
}
