import 'package:flutter/material.dart';
import 'package:medoraapp/features/analysis/data/models/analysis_category_model.dart';

class AnalysisCategoriesFilter extends StatelessWidget {
  final List<AnalysisCategoryModel> categories;
  final int? selectedCategoryId;
  final ValueChanged<int?> onCategorySelected;

  const AnalysisCategoriesFilter({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildChip(
              title: "الكل",
              isSelected: selectedCategoryId == null,
              onTap: () => onCategorySelected(null),
            );
          }

          final category = categories[index - 1];

          return _buildChip(
            title: category.title,
            isSelected: selectedCategoryId == category.id,
            onTap: () => onCategorySelected(category.id),
          );
        },
      ),
    );
  }

  Widget _buildChip({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff00B8C9) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xffD9D9D9)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
