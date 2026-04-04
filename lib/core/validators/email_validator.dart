import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';

String? emailValidator(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.emailRequired;
  }
  // تحقق أقوى باستخدام regex للبريد الإلكتروني
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  if (!emailRegex.hasMatch(value)) {
    return AppLocalizations.of(context)!.invalidEmail;
  }
  return null;
}
