import 'package:flutter/material.dart';
import 'package:medoraapp/presentation/Widgets/AppSkeleton/app_skeleton.dart';
import 'package:medoraapp/presentation/Widgets/AppSkeleton/skeleton_box.dart';

class SortSkeleton extends StatelessWidget {
  const SortSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSkeleton(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: const [
            SkeletonBox(height: 12, width: 80),
            SizedBox(width: 10),
            SkeletonBox(height: 30, width: 120),
          ],
        ),
      ),
    );
  }
}
