import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/analysis/data/models/analysis_model.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_card_base.dart';

class AnalysisCard extends StatelessWidget {
  final AnalysisModel analysis;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool isSelected;

  const AnalysisCard({
    super.key,
    required this.analysis,
    this.onTap,
    this.onLongPress,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      onLongPress: onLongPress,
      isSelected: isSelected,

      top: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${analysis.name} (${analysis.shortName})',
            style: CairoFonts.bold(fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(analysis.description, style: CairoFonts.semiBold(fontSize: 12)),
        ],
      ),

      bottom: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'عرض المخابر',
                  style: CairoFonts.bold(color: AppColors.primaryColor),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
