import 'package:flutter/material.dart';
import 'package:medoraapp/presentation/Widgets/AppSkeleton/skeleton_box.dart';

class SearchSkeleton extends StatelessWidget {
  const SearchSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: SkeletonBox(height: 45, width: double.infinity),
    );
  }
}
