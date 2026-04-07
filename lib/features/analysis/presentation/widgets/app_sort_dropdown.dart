import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class AppSortDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const AppSortDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  String get label {
    switch (value) {
      case "price":
        return "الأقل سعراً";
      case "rating":
        return "الأعلى تقييماً";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onChanged,
      itemBuilder: (context) => const [
        PopupMenuItem(value: "price", child: Text("الأقل سعراً")),
        PopupMenuItem(value: "rating", child: Text("الأعلى تقييماً")),
      ],

      /// 🔥 الشكل الخارجي
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withValues(alpha: 0.09),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primaryColor.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///  سهم
            Icon(
              Icons.keyboard_arrow_down,
              size: 18,
              color: AppColors.IconColor.withValues(alpha: 0.7),
            ),

            const SizedBox(width: 4),

            /// النص
            Text(
              label,
              style: CairoFonts.semiBold(
                fontSize: 12,
                color: AppColors.IconColor.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
