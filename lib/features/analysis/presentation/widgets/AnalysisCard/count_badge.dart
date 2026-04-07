import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/constants/fonts.dart';

class CountBadge extends StatelessWidget {
  final int count;
  final String label;

  const CountBadge({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "$count $label",
        style: CairoFonts.semiBold(fontSize: 11, color: AppColors.primaryColor),
      ),
    );
  }
}
