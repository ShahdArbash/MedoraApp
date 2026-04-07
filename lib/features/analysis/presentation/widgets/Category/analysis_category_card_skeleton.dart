import 'package:flutter/material.dart';
import 'package:medoraapp/presentation/Widgets/AppSkeleton/app_skeleton.dart';
import 'package:medoraapp/presentation/Widgets/AppSkeleton/skeleton_box.dart';

class AnalysisCategoryCardSkeleton extends StatelessWidget {
  const AnalysisCategoryCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSkeleton(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            /// 🔵 أيقونة دائرية
            SkeletonBox(height: 48, width: 48, radius: 24),

            SizedBox(height: 12),

            /// 🧪 اسم الفئة
            SkeletonBox(height: 14, width: 80),

            SizedBox(height: 6),

            /// 🔢 عدد التحاليل
            SkeletonBox(height: 12, width: 60),
          ],
        ),
      ),
    );
  }
}
