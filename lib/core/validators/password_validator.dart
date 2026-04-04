import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';

String? passwordValidator(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.passwordRequired;
  }
  if (value.length < 10) {
    return AppLocalizations.of(context)!.passwordTooShort;
  }
  // تحقق من وجود حرف كبير، صغير، رقم، ورمز خاص
  final hasUppercase = value.contains(RegExp(r'[A-Z]'));
  final hasLowercase = value.contains(RegExp(r'[a-z]'));
  final hasDigits = value.contains(RegExp(r'[0-9]'));
  final hasSpecialCharacters = value.contains(
    RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
  );

  int score = 0;
  if (hasUppercase) score++;
  if (hasLowercase) score++;
  if (hasDigits) score++;
  if (hasSpecialCharacters) score++;

  if (score < 3) {
    return AppLocalizations.of(
      context,
    )!.passwordWeakCriteria;
  }
  return null;
}
