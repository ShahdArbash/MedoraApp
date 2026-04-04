import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';

class SignUpActionButton extends StatelessWidget {
  const SignUpActionButton({
    super.key,
    required this.formKey,
    required this.onSubmit,
    required this.isLoading,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback onSubmit;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GenericButton(
      label: AppLocalizations.of(context)!.signUp,
      isLoading: isLoading,
      backgroundColor: Colors.white,
      textColor: AppColors.primaryColor,
      onPressed: isLoading
          ? null
          : () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                onSubmit();
              }
            },
    );
  }
}
