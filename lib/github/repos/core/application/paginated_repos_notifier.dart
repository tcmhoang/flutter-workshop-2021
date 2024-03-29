import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/infrastructure/fresh.dart';
import '../../../core/domain/github_failure.dart';
import '../../../core/domain/github_repo.dart';
import '../../../core/infrastructure/pagination_config.dart';

part 'paginated_repos_notifier.freezed.dart';

typedef RepositoryGetter
    = Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> Function(int page);

@freezed
class PaginatedReposState with _$PaginatedReposState {
  const PaginatedReposState._();
  const factory PaginatedReposState.initial(Fresh<List<GithubRepo>> repos) =
      _Initial;
  const factory PaginatedReposState.loadInProgress(
    Fresh<List<GithubRepo>> repos,
    int itemPerPage,
  ) = _LoadInProgress;
  const factory PaginatedReposState.loadSuccess(
    Fresh<List<GithubRepo>> repos, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;

  const factory PaginatedReposState.loadFailure(
    Fresh<List<GithubRepo>> repos,
    GithubFailure failure,
  ) = _LoadFailure;
}

class PaginatedReposNotifier extends StateNotifier<PaginatedReposState> {
  int _page = 1;

  PaginatedReposNotifier() : super(PaginatedReposState.initial(Fresh.yes([])));

  @protected
  void resetState() {
    _page = 1;
    state = PaginatedReposState.initial(Fresh.yes([]));
  }

  @protected
  Future<void> getNextPage(
    RepositoryGetter getter,
  ) async {
    final pages = state.repos;
    state = PaginatedReposState.loadInProgress(
      pages,
      PaginationConfig.itemsPerPage,
    );
    final newlyPages = await getter(_page);
    state =
        newlyPages.fold((l) => PaginatedReposState.loadFailure(pages, l), (r) {
      _page++;
      return PaginatedReposState.loadSuccess(
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
