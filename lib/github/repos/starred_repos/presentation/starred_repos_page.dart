import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';

import '../../../../auth/shared/provider.dart';
import 'paginated_repos_list_view.dart';

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
    SchedulerBinding.instance?.addPostFrameCallback(
      (_) => ref
          .read(starredReposNotifierProvider.notifier)
          .getNextStarredReposPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starred repositories'),
        actions: [
          IconButton(
            onPressed: () => ref.read(authNotifierProvider.notifier).signOut(),
            icon: const Icon(MdiIcons.logoutVariant),
          )
        ],
      ),
      body: const PaginatedReposListView(),
    );
  }
}
