import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingRepoTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListTile(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 100,
              height: 14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.grey,
              ),
            ),
          ),
          subtitle: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 250,
              height: 14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.grey,
              ),
            ),
          ),
          leading: const CircleAvatar(),
          trailing: Column(
            children: [
              const Icon(Icons.star_border),
              Text(
                '',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      );
}
