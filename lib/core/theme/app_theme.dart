import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';

class AppTheme {
  static const String fontFamily = 'Cairo';

  static ThemeData get theme => ThemeData(
    fontFamily: fontFamily,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
    // يمكن إضافة المزيد من الخصائص هنا
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: fontFamily),
      bodyMedium: TextStyle(fontFamily: fontFamily),
      bodySmall: TextStyle(fontFamily: fontFamily),
      headlineLarge: TextStyle(fontFamily: fontFamily),
      headlineMedium: TextStyle(fontFamily: fontFamily),
      headlineSmall: TextStyle(fontFamily: fontFamily),
      titleLarge: TextStyle(fontFamily: fontFamily),
      titleMedium: TextStyle(fontFamily: fontFamily),
      titleSmall: TextStyle(fontFamily: fontFamily),
      labelLarge: TextStyle(fontFamily: fontFamily),
      labelMedium: TextStyle(fontFamily: fontFamily),
      labelSmall: TextStyle(fontFamily: fontFamily),
    ),
  );
}
