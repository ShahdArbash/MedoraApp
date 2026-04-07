import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';

class OfferBadge extends StatelessWidget {
  const OfferBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "عرض خاص",
        style: CairoFonts.bold(color: Colors.white, fontSize: 10),
      ),
    );
  }
}
