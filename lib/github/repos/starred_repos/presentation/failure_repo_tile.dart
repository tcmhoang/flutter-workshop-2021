import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/domain/github_failure.dart';
import '../../../core/shared/providers.dart';

class FailureRepoTile extends ConsumerWidget {
  const FailureRepoTile(this.failure);
  final GithubFailure failure;

  @override
  Widget build(BuildContext context, WidgetRef ref) => ListTileTheme(
        textColor: Theme.of(context).colorScheme.onError,
        iconColor: Theme.of(context).colorScheme.onError,
        child: Card(
          color: Theme.of(context).errorColor,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: ListTile(
            title: const Text('An error occurred, please try again!'),
            subtitle: Text(
              failure.map(api: (_) => 'API returned ${_.errorCode}'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            leading: const SizedBox(
              height: double.infinity,
              child: Icon(Icons.warning),
            ),
            trailing: IconButton(
              onPressed: () {
                ref
                    .read(starredReposNotifierProvider.notifier)
                    .getNextStarredReposPage();
              },
              icon: const Icon(Icons.refresh),
            ),
          ),
        ),
      );
}
