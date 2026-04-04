import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/core/validators/confirm_password_validator.dart';
import 'base_password_field.dart';

class ConfirmPasswordField extends StatefulWidget {
  const ConfirmPasswordField({
    super.key,
    required this.passwordController,
    required this.onSaved,
    this.controller,
  });

  final TextEditingController passwordController;
  final void Function(String?) onSaved;
  final TextEditingController? controller;

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  final ValueNotifier<String?> _errorNotifier = ValueNotifier(null);
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _showErrorNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      _showErrorNotifier.value = _focusNode.hasFocus;
    });
    widget.passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _errorNotifier.dispose();
    _focusNode.dispose();
    _showErrorNotifier.dispose();
    widget.passwordController.removeListener(_onPasswordChanged);
    super.dispose();
  }

  void _onPasswordChanged() {
    // Re-validate confirm password when password changes
    if (widget.controller != null && widget.controller!.text.isNotEmpty) {
      _errorNotifier.value = confirmPasswordValidator(
        widget.controller!.text,
        widget.passwordController.text,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePasswordField(
      labelText: AppLocalizations.of(context)!.confirmPassword,
      onSaved: widget.onSaved,
      validator: (value) => confirmPasswordValidator(
        value,
        widget.passwordController.text,
        context,
      ),
      onChanged: (value) {
        _errorNotifier.value = confirmPasswordValidator(
          value,
          widget.passwordController.text,
          context,
        );
      },
      errorNotifier: _errorNotifier,
      showErrorNotifier: _showErrorNotifier,
      focusNode: _focusNode,
      controller: widget.controller,
    );
  }
}
