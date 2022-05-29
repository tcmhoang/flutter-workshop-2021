import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../application/search_history_notifier.dart';
import '../shared/provider.dart';

class SearchBar extends ConsumerStatefulWidget {
  const SearchBar({
    required this.title,
    required this.hint,
    required this.body,
    required this.onNavigateToPage,
    required this.onSignOut,
    Key? key,
  }) : super(key: key);

  final String title;
  final String hint;
  final Widget body;
  final void Function(String searchTerm) onNavigateToPage;
  final VoidCallback onSignOut;

  @override
  SearchBarState createState() => SearchBarState();
}

class SearchBarState extends ConsumerState<SearchBar> {
  late FloatingSearchBarController _controller;
  @override
  void initState() {
    super.initState();
    ref
        .read<SearchHistoryNotifier>(searchHistoryNotitiferProvider.notifier)
        .watchSearchTerms();

    _controller = FloatingSearchBarController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      controller: _controller,
      onSubmitted: (query) {
        widget.onNavigateToPage(query);
        ref.read(searchHistoryNotitiferProvider.notifier).addSearchTerm(query);
        _controller.close();
      },
      builder: (context, transition) {
        return Consumer(
          builder: (ctx, ref, child) {
            final searchedHistoryState =
                ref.watch(searchHistoryNotitiferProvider);

            return searchedHistoryState.map(
              data: (history) {
                return Column(
                  children: history.value
                      .map((term) => ListTile(title: Text(term)))
                      .toList(),
                );
              },
              error: (_) => ListTile(
                title: Text('Unexpected error ${_.error}'),
              ),
              loading: (_) => const ListTile(
                title: LinearProgressIndicator(),
              ),
            );
          },
        );
      },
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'Tap to search 👆',
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
      body: FloatingSearchBarScrollNotifier(child: widget.body),
      hint: widget.hint,
      actions: [
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
        FloatingSearchBarAction(
          child: IconButton(
            splashRadius: 18,
            icon: const Icon(MdiIcons.logoutVariant),
            onPressed: widget.onSignOut,
          ),
        )
      ],
    );
  }
}
