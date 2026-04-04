import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  DescriptionText({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white.withValues(alpha: 0.9),
        letterSpacing: 0.5,
      ),
    );
  }
}
