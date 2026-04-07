import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';

class AppInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const AppInfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(text, style: CairoFonts.regular(fontSize: 12)),
      ],
    );
  }
}
