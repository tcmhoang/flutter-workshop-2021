import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/domain/github_repo.dart';

class RepoDetailPage extends ConsumerStatefulWidget {
  final GithubRepo repo;

  const RepoDetailPage(this.repo, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RepoDetailPageState();
}

class _RepoDetailPageState extends ConsumerState<RepoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Hero(
              tag: widget.repo.fullName,
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  widget.repo.owner.avatarUrlSmall,
                ),
                backgroundColor: Colors.transparent,
                radius: 16,
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                widget.repo.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
