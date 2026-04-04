import 'package:medoraapp/features/auth/logic/Cubits/cubit_login/login_cubit.dart';
import 'package:medoraapp/features/auth/data/services/api_service.dart';
import 'package:medoraapp/features/auth/data/services/auth_service.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/features/auth/presentation/widgets/Login_View_Widgets/google_sign_in_widget.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/register_button.dart';
import '../../../../presentation/Widgets/Methods/build_background_view.dart';
import '../../../../presentation/Widgets/Form_Fields/email_field.dart';
import '../widgets/Login_View_Widgets/forgot_password.dart';
import '../../../../presentation/Widgets/Buttons/login_button_action.dart';
import '../../../../presentation/Widgets/Form_Fields/password_field.dart';
import '../../../../presentation/Widgets/Texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      context.read<LoginCubit>().login(
        email: _email.trim().toLowerCase(),
        password: _password.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BiuldBackgroundView(),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Welcome Text
                  TitleText(title: AppLocalizations.of(context)!.welcomeBack),
                  const SizedBox(height: 65),
                  // Login Form Card
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email Field
                        EmailField(onSaved: (value) => _email = value ?? ''),
                        const SizedBox(height: 20),
                        // Password
                        PasswordField(
                          onSaved: (value) => _password = value ?? '',
                        ),
                        // Forgot Password
                        ForgotPassword(),
                        const SizedBox(height: 5),
                        // Login Button
                        LoginButtonAction(
                          formKey: _formKey,
                          onSubmit: () => _submit(context),
                        ),
                        const SizedBox(height: 20),
                        // Register Button
                        RegisterButton(),
                        const SizedBox(height: 30),
                        // Google Sign In Widget
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
