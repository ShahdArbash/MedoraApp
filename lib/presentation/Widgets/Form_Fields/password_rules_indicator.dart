import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';

class PasswordRulesIndicator extends StatelessWidget {
  final ValueListenable<String> password;

  const PasswordRulesIndicator({super.key, required this.password});

  bool _hasMinLength(String value) => value.length >= 8;
  bool _hasUpperCase(String value) => value.contains(RegExp(r'[A-Z]'));
  bool _hasLowerCase(String value) => value.contains(RegExp(r'[a-z]'));
  bool _hasNumber(String value) => value.contains(RegExp(r'[0-9]'));
  bool _hasSpecialChar(String value) =>
      value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  int _getStrengthScore(String value) {
    int score = 0;
    if (_hasMinLength(value)) score++;
    if (_hasUpperCase(value)) score++;
    if (_hasLowerCase(value)) score++;
    if (_hasNumber(value)) score++;
    if (_hasSpecialChar(value)) score++;
    return score;
  }

  String _getStrengthText(BuildContext context, int score) {
    if (score <= 1) return AppLocalizations.of(context)!.passwordStrengthWeak;
    if (score <= 3) return AppLocalizations.of(context)!.passwordMedium;
    return AppLocalizations.of(context)!.passwordStrong;
  }

  Color _getStrengthColor(int score) {
    if (score <= 1) return Colors.red;
    if (score <= 3) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: password,
      builder: (context, value, _) {
        final score = _getStrengthScore(value);
        final strengthText = _getStrengthText(context, score);
        final strengthColor = _getStrengthColor(score);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // مؤشر القوة
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.passwordStrengthLabel,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  strengthText,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: strengthColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: score / 5.0,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(strengthColor),
            ),
            const SizedBox(height: 8),
            // الشروط
            _RuleItem(
              text: AppLocalizations.of(context)!.passwordRuleMinLength,
              isValid: _hasMinLength(value),
            ),
            _RuleItem(
              text: AppLocalizations.of(context)!.passwordRuleUppercase,
              isValid: _hasUpperCase(value),
            ),
            _RuleItem(
              text: AppLocalizations.of(context)!.passwordRuleLowercase,
              isValid: _hasLowerCase(value),
            ),
            _RuleItem(
              text: AppLocalizations.of(context)!.passwordRuleDigit,
              isValid: _hasNumber(value),
            ),
            _RuleItem(
              text: AppLocalizations.of(context)!.passwordRuleSpecialChar,
              isValid: _hasSpecialChar(value),
            ),
          ],
        );
      },
    );
  }
}

class _RuleItem extends StatelessWidget {
  final String text;
  final bool isValid;

  const _RuleItem({required this.text, required this.isValid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: isValid ? Colors.green : Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isValid ? Icons.check : Icons.close,
              size: 12,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isValid ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
