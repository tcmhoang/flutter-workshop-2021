import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/core/shared/provider.dart';
import 'package:repo_viewer/github/core/infrastructure/github_header_cache.dart';
import 'package:repo_viewer/github/repos/starred_repos/application/starred_repos_notifier.dart';
import 'package:repo_viewer/github/repos/starred_repos/infrastructure/starred_repos_local_service.dart';
import 'package:repo_viewer/github/repos/starred_repos/infrastructure/starred_repos_remote_service.dart';
import 'package:repo_viewer/github/repos/starred_repos/infrastructure/starred_repos_repository.dart';

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

final starredReposNotifierProvider =
    StateNotifierProvider<StarredReposNotifier, StarredReposState>(
  (ref) => StarredReposNotifier(ref.watch(starredReposProvider)),
);
