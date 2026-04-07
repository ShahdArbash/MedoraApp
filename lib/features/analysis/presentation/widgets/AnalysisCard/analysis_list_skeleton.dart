import 'package:flutter/material.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisCard/analysis_card_skeleton.dart';

class AnalysisListSkeleton extends StatelessWidget {
  const AnalysisListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (_, __) => const AnalysisCardSkeleton(),
    );
  }
}
