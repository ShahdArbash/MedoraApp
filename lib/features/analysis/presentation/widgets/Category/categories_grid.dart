import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/analysis_category_model.dart';
import '../../../logic/cubit/analysis_selection_cubit.dart';
import 'analysis_category_card.dart';

class AnalysisCategoryGrid extends StatelessWidget {
  final List<AnalysisCategoryModel> categories;

  const AnalysisCategoryGrid({super.key, required this.categories});

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
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];

        return BlocSelector<AnalysisSelectionCubit, int, bool>(
          selector: (selectedIndex) => selectedIndex == index,
          builder: (context, isSelected) {
            return AnalysisCategoryBaseCard(
              category: category,
              isSelected: isSelected,
              onTap: () {
                context.read<AnalysisSelectionCubit>().toggle(index);
              },
            );
          },
        );
      },
    );
  }
}
