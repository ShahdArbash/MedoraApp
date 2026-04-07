import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/fonts.dart';

class AppSearchField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String hint;

  const AppSearchField({
    super.key,
    this.onChanged,
    this.hint = "ابحث عن تحليل...",
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: CairoFonts.regular(
          fontSize: 13,
          color: AppColors.textSecondaryColor,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.textSecondaryColor.withValues(alpha: 0.4),
        ),
        filled: true,
        fillColor: AppColors.primaryColor.withValues(alpha: 0.1),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.textSecondaryColor.withValues(alpha: 0.3),
            width: 1,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.textSecondaryColor.withValues(alpha: 0.3),
            width: 1,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primaryColor, // 👈 لما يركز المستخدم
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
