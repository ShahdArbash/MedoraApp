import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';

String? nameValidator(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.fullNameRequired;
  }
  if (value.length < 2) {
    return AppLocalizations.of(context)!.nameInvalidLength;
  }
  // تحقق من أن الاسم يحتوي على أحرف فقط (بالإضافة إلى المسافات)
  final nameRegex = RegExp(
    r'^[a-zA-Z\s\u0600-\u06FF]+$',
  ); // يدعم العربية والإنجليزية
  if (!nameRegex.hasMatch(value)) {
    return AppLocalizations.of(context)!.nameInvalidChars;
  }
  return null;
}
