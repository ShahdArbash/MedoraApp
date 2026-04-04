import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';

String? confirmPasswordValidator(
  String? value,
  String password,
  BuildContext context,
) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.confirmPasswordRequired;
  }
  if (value != password) {
    return AppLocalizations.of(context)!.passwordsDoNotMatch;
  }
  return null;
}
