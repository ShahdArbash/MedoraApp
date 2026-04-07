import 'package:flutter/material.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisLabCard/analysis_lab_card_skeleton.dart';

class AnalysisLabsSkeletonList extends StatelessWidget {
  const AnalysisLabsSkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (_, __) => const AnalysisLabCardSkeleton(),
    );
  }
}
