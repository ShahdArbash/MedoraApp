import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/core/storage/token_storage.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_login/login_cubit.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';
import '/presentation/views/home_view.dart';

class LoginButtonAction extends StatelessWidget {
  const LoginButtonAction({super.key, required this.onSubmit});

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) => current is! LoginLoading,

      listener: (context, state) async {
        if (state is LoginSuccess) {
          await TokenStorage.saveTokens(accessToken: state.data.token);

          if (!context.mounted) return;

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeView()),
          );
        }

        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },

      builder: (context, state) {
        final isLoading = state is LoginLoading;

        return GenericButton(
          label: isLoading ? l10n.loading : l10n.login,
          onPressed: isLoading ? null : onSubmit,
          backgroundColor: Colors.white,
          textColor: AppColors.primaryColor,
          fontSize: 18,
        );
      },
    );
  }
}
