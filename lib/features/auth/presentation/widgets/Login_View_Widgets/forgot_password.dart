import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/l10n/app_localizations.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Implement forgot password functionality here
        },
        child: Text(
          AppLocalizations.of(context)!.forgotPassword,
          style: CairoFonts.bold(
            fontSize: 14,
            color: AppColors.fieldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
