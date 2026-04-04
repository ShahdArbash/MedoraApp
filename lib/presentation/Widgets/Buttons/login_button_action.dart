import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/core/storage/token_storage.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_login/login_cubit.dart';
import 'package:medoraapp/features/auth/auth_failure_reason.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';
import '/presentation/views/home_view.dart';

class LoginButtonAction extends StatelessWidget {
  const LoginButtonAction({
    super.key,
    required this.formKey,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          await TokenStorage.saveToken(state.response.token);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeView()),
          );
        }

        if (state is LoginError) {
          final l10n = AppLocalizations.of(context)!;
          final text = switch (state.reason) {
            AuthFailureReason.invalidCredentials =>
              l10n.authErrorInvalidCredentials,
            AuthFailureReason.emailTaken => l10n.authErrorEmailTaken,
            AuthFailureReason.network => l10n.networkError,
            AuthFailureReason.server => l10n.serverError,
            AuthFailureReason.unknown => l10n.unexpectedError,
          };
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(text), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        return GenericButton(
          label: state is LoginLoading
              ? AppLocalizations.of(context)!.loading
              : AppLocalizations.of(context)!.login,
          onPressed: state is LoginLoading ? null : onSubmit,
          backgroundColor: Colors.white,
          textColor: AppColors.primaryColor,
          fontSize: 18,
        );
      },
    );
  }
}
