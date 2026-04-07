import 'package:flutter/material.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisLabCard/sort_bar_skeleton.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_card_base.dart';
import 'package:medoraapp/presentation/Widgets/AppSkeleton/app_skeleton.dart';
import 'package:medoraapp/presentation/Widgets/AppSkeleton/skeleton_box.dart';

class AnalysisLabCardSkeleton extends StatelessWidget {
  const AnalysisLabCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSkeleton(
      child: AppCard(
        top: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔥 اسم + badge
            Row(
              children: const [
                Expanded(
                  child: SkeletonBox(height: 14, width: double.infinity),
                ),
                SizedBox(width: 8),
                SkeletonBox(height: 20, width: 60),
              ],
            ),

            const SizedBox(height: 10),

            const SkeletonBox(height: 12, width: 200),
            const SizedBox(height: 6),
            const SkeletonBox(height: 12, width: 150),

            const SizedBox(height: 10),

            Row(
              children: const [
                SkeletonBox(height: 12, width: 120),
                Spacer(),
                SkeletonBox(height: 14, width: 60),
              ],
            ),
          ],
        ),

        bottom: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(child: SkeletonBox(height: 45, width: double.infinity)),
        ),
      ),
    );
  }
}
