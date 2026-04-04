import 'package:flutter/material.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/password_field.dart';
import 'password_rules_indicator.dart';

class PasswordFieldWithRules extends StatefulWidget {
  const PasswordFieldWithRules({
    super.key,
    required this.onSaved,
    this.controller,
  });

  final void Function(String?) onSaved;
  final TextEditingController? controller;

  @override
  State<PasswordFieldWithRules> createState() => _PasswordFieldWithRulesState();
}

class _PasswordFieldWithRulesState extends State<PasswordFieldWithRules> {
  final ValueNotifier<String> _passwordNotifier = ValueNotifier('');
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _passwordNotifier.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PasswordField(
          controller: widget.controller,
          onSaved: widget.onSaved,
          focusNode: _focusNode,
          onChanged: (value) {
            _passwordNotifier.value = value;
          },
        ),
        const SizedBox(height: 8),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _hasFocus
              ? PasswordRulesIndicator(
                  key: const ValueKey('rules'),
                  password: _passwordNotifier,
                )
              : const SizedBox.shrink(key: ValueKey('empty')),
        ),
      ],
    );
  }
}
