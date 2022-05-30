import 'dart:io';

import 'package:auto_route/auto_route.dart';
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
      onSubmitted: (query) => navigateAndAddHistory(query),
      automaticallyImplyBackButton: false,
      leadingActions: [
        IconButton(
          splashRadius: 10,
          icon: Icon(
            AutoRouter.of(context).canPopSelfOrChildren && Platform.isIOS
                ? Icons.arrow_back_ios
                : Icons.arrow_back,
          ),
          onPressed: () => AutoRouter.of(context).pop(),
        )
      ],
      builder: (context, transition) {
        return Material(
          color: Theme.of(context).cardColor,
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.hardEdge,
          child: Consumer(
            builder: (ctx, ref, child) {
              final searchedHistoryState =
                  ref.watch(searchHistoryNotitiferProvider);

              return searchedHistoryState.map(
                data: (history) {
                  if (_controller.query.isEmpty && history.value.isEmpty) {
                    return Container(
                      height: 56,
                      alignment: Alignment.center,
                      child: Text(
                        'Start Searching',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    );
                  } else if (history.value.isEmpty) {
                    return ListTile(
                      title: Text(_controller.query),
                      leading: const Icon(Icons.search),
                      onTap: () => navigateAndAddHistory(_controller.query),
                    );
                  }
                  return Column(
                    children: history.value
                        .map(
                          (term) => ListTile(
                            title: Text(
                              term,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            leading: const Icon(Icons.history),
                            trailing: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () => ref
                                  .read(searchHistoryNotitiferProvider.notifier)
                                  .deleteSearchTerm(term),
                            ),
                            onTap: () {
                              navigateAndPushFirst(term, ref);
                            },
                          ),
                        )
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
          ),
        );
      },
      onQueryChanged: (query) => ref
          .read(searchHistoryNotitiferProvider.notifier)
          .watchSearchTerms(filter: query),
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

  void navigateAndAddHistory(String query) {
    widget.onNavigateToPage(query);
    ref.read(searchHistoryNotitiferProvider.notifier).addSearchTerm(query);
    _controller.close();
  }

  void navigateAndPushFirst(String term, WidgetRef ref) {
    widget.onNavigateToPage(term);
    ref.read(searchHistoryNotitiferProvider.notifier).putSearchTermFirst(term);
    _controller.close();
  }
}
