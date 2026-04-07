import 'package:flutter/material.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_card_base.dart';
import 'package:medoraapp/presentation/Widgets/AppSkeleton/app_skeleton.dart';
import 'package:medoraapp/presentation/Widgets/AppSkeleton/skeleton_box.dart';

class AnalysisCardSkeleton extends StatelessWidget {
  const AnalysisCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSkeleton(
      child: AppCard(
        top: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            /// 🧪 عنوان التحليل
            SkeletonBox(height: 14, width: 180),
            SizedBox(height: 6),

            /// 📝 الوصف
            SkeletonBox(height: 12, width: double.infinity),
            SizedBox(height: 4),
            SkeletonBox(height: 12, width: 200),
          ],
        ),

        bottom: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [SkeletonBox(height: 20, width: 100)],
        ),
      ),
    );
  }
}
