import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';

class TitleText extends StatelessWidget {
  TitleText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: CairoFonts.bold(
        fontSize: 24,
        color: Colors.white,
        letterSpacing: 1.2,
      ),
    );
  }
}
