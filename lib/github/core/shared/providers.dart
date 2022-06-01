import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/github/detail/application/repo_detail_notifier.dart';
import 'package:repo_viewer/github/detail/infrastructure/repo_detail_local_service.dart';
import 'package:repo_viewer/github/detail/infrastructure/repo_detail_repository.dart';

import '../../../core/shared/provider.dart';
import '../../detail/infrastructure/repo_detail_remote_service.dart';
import '../../repos/core/application/paginated_repos_notifier.dart';
import '../../repos/searched_repos/application/searched_repos_notifier.dart';
import '../../repos/searched_repos/infrastructure/searched_repos_remote_service.dart';
import '../../repos/searched_repos/infrastructure/searched_repos_repository.dart';
import '../../repos/starred_repos/application/starred_repos_notifier.dart';
import '../../repos/starred_repos/infrastructure/starred_repos_local_service.dart';
import '../../repos/starred_repos/infrastructure/starred_repos_remote_service.dart';
import '../../repos/starred_repos/infrastructure/starred_repos_repository.dart';
import '../infrastructure/github_header_cache.dart';

final githubHeaderCacheProvider = Provider(
  (ref) => GithubHeaderCache(ref.watch(sembastProvider)),
);

final starredReposLocalService = Provider(
  (ref) => StarredReposLocalService(ref.watch(sembastProvider)),
);

final starredReposRemoteProvider = Provider(
  (ref) => StarredReposRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeaderCacheProvider),
  ),
);

final starredReposProvider = Provider(
  (ref) => StarredReposRepository(
    ref.watch(starredReposRemoteProvider),
    ref.watch(starredReposLocalService),
  ),
);

final starredReposNotifierProvider = StateNotifierProvider.autoDispose<
    StarredReposNotifier, PaginatedReposState>(
  (ref) => StarredReposNotifier(ref.watch(starredReposProvider)),
);

final searchedReposRemoteProvider = Provider(
  (ref) => SearchedReposRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeaderCacheProvider),
  ),
);

final searchedReposProvider = Provider(
  (ref) => SearchedReposRepository(
    ref.watch(searchedReposRemoteProvider),
  ),
);

final searchedReposNotifierProvider = StateNotifierProvider.autoDispose<
    SearchedReposNotifier, PaginatedReposState>(
  (ref) => SearchedReposNotifier(ref.watch(searchedReposProvider)),
);

final repoDetailLocalProvider = Provider(
  (ref) => RepoDetailLocalService(
    ref.watch(sembastProvider),
    ref.watch(githubHeaderCacheProvider),
  ),
);

final repoDetailRemoteService = Provider(
  (ref) => RepoDetailRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeaderCacheProvider),
  ),
);

final repoDetailRepositoryProvider = Provider(
  (ref) => RepoDetailRepostory(
    ref.watch(repoDetailLocalProvider),
    ref.watch(repoDetailRemoteService),
  ),
);

final repoDetailNotifierProvider =
    StateNotifierProvider.autoDispose<RepoDetailNotifer, RepoDetailState>(
  (ref) => RepoDetailNotifer(
    ref.watch(repoDetailRepositoryProvider),
  ),
);
