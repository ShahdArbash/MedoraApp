import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_card_base.dart';

class AnalysisCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const AnalysisCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      top: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: CairoFonts.bold(fontSize: 14)),
          const SizedBox(height: 4),
          Text(subtitle, style: CairoFonts.semiBold(fontSize: 12)),
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
