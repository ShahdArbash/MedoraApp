import 'package:flutter/material.dart';
import 'build_text_form_field.dart';

class BasePasswordField extends StatefulWidget {
  const BasePasswordField({
    super.key,
    required this.labelText,
    required this.validator,
    required this.onSaved,
    this.focusNode,
    this.onChanged,
    this.errorNotifier,
    this.showErrorNotifier,
    this.controller,
  });

  final String labelText;
  final String? Function(String?) validator;
  final void Function(String?) onSaved;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueNotifier<String?>? errorNotifier;
  final ValueNotifier<bool>? showErrorNotifier;
  final TextEditingController? controller;

  @override
  State<BasePasswordField> createState() => _BasePasswordFieldState();
}

class _BasePasswordFieldState extends State<BasePasswordField> {
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildTextFormField(
      labelText: widget.labelText,
      icon: Icons.lock,
      obscurePassword: _obscurePassword,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      errorNotifier: widget.errorNotifier,
      showErrorNotifier: widget.showErrorNotifier,
      focusNode: widget.focusNode,
      controller: widget.controller,
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
        ),
        onPressed: _togglePasswordVisibility,
      ),
    );
  }
}
