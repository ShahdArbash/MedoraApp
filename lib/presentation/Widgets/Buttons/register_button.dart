import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/features/auth/data/services/api_service.dart';
import 'package:medoraapp/features/auth/data/services/auth_service.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_register/register_cubit.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';
import 'package:medoraapp/features/auth/presentation/views/signup_view.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericButton(
      hasBorder: true,
      borderColor: AppColors.fieldBackgroundColor,
      label: AppLocalizations.of(context)!.register, // "إنشاء حساب"
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => RegisterCubit(AuthService(ApiService())),
              child: const SignupView(),
            ),
          ),
        );
      },
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
      fontSize: 18,
    );
  }
}
