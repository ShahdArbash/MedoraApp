import 'package:flutter/material.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';

class CancelAppointmentButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CancelAppointmentButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GenericButton(
      label: "إلغاء الموعد",
      onPressed: onPressed,
      backgroundColor: const Color(0x30A60000),
      textColor: const Color(0xFFE21C1C),
      height: 40,
      fontSize: 12,
      borderRadius: 8,
      hasShadow: false,
    );
  }
}
