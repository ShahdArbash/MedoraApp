import 'package:flutter/material.dart';

BoxDecoration BiuldFormCardDecoration() {
  return BoxDecoration(
    color: Colors.white.withValues(alpha: 0.95),
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.1),
        blurRadius: 30,
        offset: const Offset(0, 15),
      ),
    ],
  );
}
