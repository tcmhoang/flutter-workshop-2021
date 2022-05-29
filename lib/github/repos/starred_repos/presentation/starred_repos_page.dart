import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../auth/shared/provider.dart';
import '../../../../core/presentation/routes/app_router.gr.dart';
import '../../../../search/presentation/seach_bar.dart';
import '../../../core/presentation/paginated_repos_list_view.dart';
import '../../../core/shared/providers.dart';

class StarredReposPage extends ConsumerStatefulWidget {
  const StarredReposPage({Key? key}) : super(key: key);

  @override
  ConsumerState<StarredReposPage> createState() => _StarredReposPageState();
}

class _StarredReposPageState extends ConsumerState<StarredReposPage> {
  @override
  void initState() {
    super.initState();
    // Future.microtask(
    //   () => ref
    //       .read(starredReposNotifierProvider.notifier)
    //       .getNextStarredReposPage(),
    // );
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(starredReposNotifierProvider.notifier)
          .getNextStarredReposPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBar(
        body: PaginatedReposListView(
          paginatedReposNotifierProvider: starredReposNotifierProvider,
          getNextPage: (WidgetRef ref) {
            ref
                .read(starredReposNotifierProvider.notifier)
                .getNextStarredReposPage();
          },
          noResultMessage:
              "That's about everything we could find in your starred repos right now.",
        ),
        title: 'Starred repositories',
        hint: 'Search all repositories...',
        onNavigateToPage: (String searchTerm) => AutoRouter.of(context).push(
          SearchedReposRoute(searchTerm: searchTerm),
        ),
        onSignOut: () => ref.read(authNotifierProvider.notifier).signOut(),
      ),
    );
  }
}
