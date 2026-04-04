import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/core/validators/password_validator.dart';
import 'base_password_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.onSaved,
    this.controller,
    this.onChanged,
    this.focusNode,
  });

  final void Function(String?) onSaved;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return BasePasswordField(
      focusNode: focusNode,
      labelText: AppLocalizations.of(context)!.password,
      onSaved: onSaved,
      validator: (value) => passwordValidator(value, context),
      onChanged: onChanged,
      controller: controller,
    );
  }
}
