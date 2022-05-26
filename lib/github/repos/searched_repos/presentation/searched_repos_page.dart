import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../auth/shared/provider.dart';
import '../../../../core/presentation/routes/app_router.gr.dart';
import '../../../core/presentation/paginated_repos_list_view.dart';
import '../../../core/shared/providers.dart';

class SearchedReposPage extends ConsumerStatefulWidget {
  const SearchedReposPage({Key? key, required this.searchTerm})
      : super(key: key);
  final String searchTerm;
  @override
  ConsumerState<SearchedReposPage> createState() => _SearchedReposPageState();
}

class _SearchedReposPageState extends ConsumerState<SearchedReposPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref
          .read(searchedReposNotifierProvider.notifier)
          .getNextSearchedReposPage(widget.searchTerm);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.searchTerm),
        actions: [
          IconButton(
            onPressed: () => ref.read(authNotifierProvider.notifier).signOut(),
            icon: const Icon(MdiIcons.logoutVariant),
          ),
          IconButton(
            onPressed: () => AutoRouter.of(context)
                .push(SearchedReposRoute(searchTerm: 'flutter')),
            icon: const Icon(MdiIcons.magnify),
          )
        ],
      ),
      body: PaginatedReposListView(
        paginatedReposNotifierProvider: starredReposNotifierProvider,
        getNextPage: (WidgetRef ref) {
          ref
              .read(searchedReposNotifierProvider.notifier)
              .getNextSearchedReposPage(widget.searchTerm);
        },
        noResultMessage: "This is all we could find right now.",
      ),
    );
  }
}
