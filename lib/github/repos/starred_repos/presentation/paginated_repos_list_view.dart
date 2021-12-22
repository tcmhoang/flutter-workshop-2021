import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';
import 'package:repo_viewer/github/repos/starred_repos/presentation/failure_repo_tile.dart';
import 'package:repo_viewer/github/repos/starred_repos/presentation/loading_repo_tile.dart';

import 'repo_tile.dart';

class PaginatedReposListView extends StatelessWidget {
  const PaginatedReposListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final state = ref.watch(starredReposNotifierProvider);
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
      },
    );
  }
}
