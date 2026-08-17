import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';

class EditAppointmentButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EditAppointmentButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GenericButton(
      label: "تعديل الموعد",
      onPressed: onPressed,
      backgroundColor: const Color(0x2B00A4A6),
      textColor: AppColors.primaryColor,
      height: 40,
      fontSize: 12,
      borderRadius: 8,
      hasShadow: false,
    );
  }
}
