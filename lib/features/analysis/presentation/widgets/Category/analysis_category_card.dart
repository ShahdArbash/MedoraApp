import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/fonts.dart';
import '../../../data/models/analysis_category_model.dart';

class AnalysisCategoryBaseCard extends StatelessWidget {
  final AnalysisCategoryModel category;
  final VoidCallback? onTap;
  final bool isSelected;

  const AnalysisCategoryBaseCard({
    super.key,
    required this.category,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 170,
      height: 135,
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryColor.withValues(alpha: 0.25)
            : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.fieldBackgroundColor,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(
                  alpha: isSelected ? 1 : 0.2,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                category.iconData,
                color: isSelected ? AppColors.whiteColor : AppColors.IconColor,
                size: 20,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              category.title,
              style: CairoFonts.regular(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              "${category.testsCount} تحليل",
              style: CairoFonts.regular(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.textSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
