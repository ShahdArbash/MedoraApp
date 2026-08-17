import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/constants/fonts.dart';

class AppointmentInfoRow extends StatelessWidget {
  final IconData? icon;
  final String text;
  final bool isPrimary;

  const AppointmentInfoRow({
    super.key,
    this.icon,
    required this.text,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon != null
            ? Icon(icon, size: 18, color: Colors.grey)
            : const SizedBox.shrink(),

        const SizedBox(width: 6),
        Text(
          text,
          style: isPrimary
              ? CairoFonts.bold(color: AppColors.primaryColor)
              : CairoFonts.regular(color: Colors.grey),
        ),
      ],
    );
  }
}
