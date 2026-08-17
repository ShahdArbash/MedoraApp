import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';

class AppointmentDetailsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AppointmentDetailsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GenericButton(
      label: "عرض التفاصيل",
      onPressed: onPressed,
      backgroundColor: AppColors.primaryColor.withValues(alpha: 0.15),
      textColor: AppColors.primaryColor,
      height: 40,
      fontSize: 12,
      borderRadius: 8,
      hasShadow: false,
    );
  }
}
