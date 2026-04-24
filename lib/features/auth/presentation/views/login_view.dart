import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/core/validators/email_validator.dart';
import 'package:medoraapp/core/validators/password_validator.dart';
import 'package:medoraapp/features/auth/data/models/login_request.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_login/login_cubit.dart';
import 'package:medoraapp/l10n/app_localizations.dart';

import '../../../../presentation/Widgets/Methods/build_background_view.dart';
import '../../../../presentation/Widgets/Form_Fields/email_field.dart';
import '../../../../presentation/Widgets/Form_Fields/password_field.dart';
import '../../../../presentation/Widgets/Buttons/login_button_action.dart';
import '../../../../presentation/Widgets/Buttons/register_button.dart';
import '../../../../presentation/Widgets/Texts/title_text.dart';
import '../widgets/Login_View_Widgets/forgot_password.dart';
import '../widgets/Login_View_Widgets/google_sign_in_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final request = LoginRequest(
        email: _emailController.text.trim().toLowerCase(),
        password: _passwordController.text.trim(),
      );

      context.read<LoginCubit>().login(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
        decoration: BiuldBackgroundView(),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TitleText(title: l10n.welcomeBack),
                  const SizedBox(height: 65),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        EmailField(
                          controller: _emailController,
                          validator: (v) => emailValidator(v, context),
                        ),

                        const SizedBox(height: 20),

                        PasswordField(controller: _passwordController),

                        const SizedBox(height: 10),

                        ForgotPassword(),

                        const SizedBox(height: 5),

                        LoginButtonAction(onSubmit: () => _submit(context)),

                        const SizedBox(height: 20),

                        RegisterButton(),

                        const SizedBox(height: 30),

                        const GoogleSignInWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
