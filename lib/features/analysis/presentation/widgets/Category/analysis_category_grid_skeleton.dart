import 'package:flutter/material.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/Category/analysis_category_card_skeleton.dart';

class AnalysisCategoryGridSkeleton extends StatelessWidget {
  const AnalysisCategoryGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (width > 900) return 4;
      if (width > 600) return 3;
      return 2;
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 6, // 👈 عدد وهمي
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemBuilder: (_, __) => const AnalysisCategoryCardSkeleton(),
    );
  }
}
