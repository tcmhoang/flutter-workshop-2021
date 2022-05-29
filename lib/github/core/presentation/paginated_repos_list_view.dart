import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../../core/presentation/toast.dart';
import '../../repos/core/application/paginated_repos_notifier.dart';
import 'failure_repo_tile.dart';
import 'loading_repo_tile.dart';
import 'no_result_display.dart';
import 'repo_tile.dart';

class PaginatedReposListView extends StatefulWidget {
  const PaginatedReposListView({
    Key? key,
    required this.paginatedReposNotifierProvider,
    required this.getNextPage,
    required this.noResultMessage,
  }) : super(key: key);

  final AutoDisposeStateNotifierProvider<PaginatedReposNotifier,
      PaginatedReposState> paginatedReposNotifierProvider;
  final void Function(WidgetRef ref) getNextPage;
  final String noResultMessage;

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
        ref.listen<PaginatedReposState>(widget.paginatedReposNotifierProvider,
            (_, state) {
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
        final state = ref.watch(widget.paginatedReposNotifierProvider);
        return NotificationListener<ScrollNotification>(
          child: state.maybeWhen(
            loadSuccess: (repos, _) => repos.entity.isEmpty,
            orElse: () => false,
          )
              ? NoResultDisplay(message: widget.noResultMessage)
              : _PaginatedListView(state: state),
          onNotification: (notification) {
            final metrics = notification.metrics;
            final limit = metrics.maxScrollExtent - metrics.viewportDimension;
            if (canLoadNextPage && metrics.pixels >= limit) {
              canLoadNextPage = false;
              widget.getNextPage(ref);
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

  final PaginatedReposState state;

  @override
  Widget build(BuildContext context) {
    // context.findAncestorWidgetOfExactType<FloatingSearchBar>()?.height;
    final fsb = FloatingSearchBar.of(context)?.widget;
    return ListView.builder(
      padding: EdgeInsets.only(
        top: fsb?.height ?? 0 + 8 + MediaQuery.of(context).padding.top,
      ),
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
