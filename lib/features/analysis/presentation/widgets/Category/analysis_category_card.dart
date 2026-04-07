import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/fonts.dart';
import '../../../data/models/analysis_category_model.dart';

class AnalysisCategoryBaseCard extends StatelessWidget {
  final AnalysisCategoryModel category;
  final VoidCallback? onTap;

  const AnalysisCategoryBaseCard({
    super.key,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 170,
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.fieldBackgroundColor, width: 2),
        color: AppColors.whiteColor,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          splashColor: AppColors.primaryColor.withValues(alpha: 0.35),
          highlightColor: AppColors.primaryColor.withValues(alpha: 0.35),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.35),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  category.iconData,
                  color: AppColors.IconColor.withValues(alpha: 0.85),
                  size: 32,
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
      ),
    );
  }
}
