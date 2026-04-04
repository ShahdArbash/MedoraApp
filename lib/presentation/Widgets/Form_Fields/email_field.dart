import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/core/validators/email_validator.dart';
import 'build_text_form_field.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key, required this.onSaved, this.controller});

  final void Function(String?) onSaved;
  final TextEditingController? controller;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  final ValueNotifier<String?> _errorNotifier = ValueNotifier(null);
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _showErrorNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      _showErrorNotifier.value = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _errorNotifier.dispose();
    _focusNode.dispose();
    _showErrorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BuildTextFormField(
      labelText: AppLocalizations.of(context)!.email,
      icon: Icons.email_outlined,
      validator: (value) => emailValidator(value, context),
      onSaved: widget.onSaved,
      onChanged: (value) {
        _errorNotifier.value = emailValidator(value, context);
      },
      errorNotifier: _errorNotifier,
      focusNode: _focusNode,
      showErrorNotifier: _showErrorNotifier,
      controller: widget.controller,
    );
  }
}
