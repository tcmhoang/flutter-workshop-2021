import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/core/presentation/toast.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';
import 'package:repo_viewer/github/repos/starred_repos/application/starred_repos_notifier.dart';
import 'package:repo_viewer/github/repos/starred_repos/presentation/failure_repo_tile.dart';
import 'package:repo_viewer/github/repos/starred_repos/presentation/loading_repo_tile.dart';

import 'repo_tile.dart';

class PaginatedReposListView extends StatefulWidget {
  const PaginatedReposListView({
    Key? key,
  }) : super(key: key);

  @override
  State<PaginatedReposListView> createState() => _PaginatedReposListViewState();
}

class _PaginatedReposListViewState extends State<PaginatedReposListView> {
  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        ref.listen<StarredReposState>(starredReposNotifierProvider, (_, state) {
          state.map(
            initial: (_) => canLoadNextPage = true,
            loadInProgress: (_) => canLoadNextPage = false,
            loadSuccess: (_) {
              if (!_.repos.isFresh && !hasAlreadyShownNoConnectionToast) {
                hasAlreadyShownNoConnectionToast = true;
                showNoConnectionToast(
                  context,
                  "You're not online. Some information may be outdated",
                );
              }
              canLoadNextPage = _.isNextPageAvailable;
            },
            loadFailure: (_) => false,
          );
        });
        final state = ref.watch(starredReposNotifierProvider);
        return NotificationListener<ScrollNotification>(
          child: _PaginatedListView(state: state),
          onNotification: (notification) {
            final metrics = notification.metrics;
            final limit = metrics.maxScrollExtent - metrics.viewportDimension;
            if (canLoadNextPage && metrics.pixels >= limit) {
              canLoadNextPage = false;
              ref
                  .read(starredReposNotifierProvider.notifier)
                  .getNextStarredReposPage();
            }
            return false;
          },
        );
      },
    );
  }
}

class _PaginatedListView extends StatelessWidget {
  const _PaginatedListView({
    Key? key,
    required this.state,
  }) : super(key: key);

  final StarredReposState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) => state.map(
        initial: (_) => RepoTile(repo: _.repos.entity[index]),
        loadInProgress: (_) => index < _.repos.entity.length
            ? RepoTile(repo: _.repos.entity[index])
            : LoadingRepoTile(),
        loadSuccess: (_) => RepoTile(repo: _.repos.entity[index]),
        loadFailure: (_) => index < _.repos.entity.length
            ? RepoTile(repo: _.repos.entity[index])
            : FailureRepoTile(_.failure),
      ),
      itemCount: state.map(
        initial: (_) => 0,
        loadInProgress: (_) => _.itemPerPage + _.repos.entity.length,
        loadSuccess: (_) => _.repos.entity.length,
        loadFailure: (_) => _.repos.entity.length + 1,
      ),
    );
  }
}
