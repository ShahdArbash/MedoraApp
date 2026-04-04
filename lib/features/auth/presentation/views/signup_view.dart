import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_register/register_cubit.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_register/register_state.dart';
import 'package:medoraapp/features/auth/auth_failure_reason.dart';
import 'package:medoraapp/features/auth/auth_scope.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/signUp_action_button.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/confirm_password_field.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/full_name_field.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/email_field.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/password_field.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/password_field_with_%20animated_switcher.dart';
import 'package:medoraapp/features/auth/presentation/widgets/Login_View_Widgets/google_sign_in_widget.dart';
import 'package:medoraapp/presentation/Widgets/Texts/title_text.dart';
import 'package:medoraapp/presentation/views/home_view.dart';
import 'package:medoraapp/features/auth/presentation/views/login_view.dart';
import '../../../../presentation/Widgets/Methods/build_background_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();

  //  Controllers for real-time access
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  //  Form values (for saving)
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BiuldBackgroundView(),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  TitleText(title: AppLocalizations.of(context)!.signupTitle),
                  const SizedBox(height: 50),
                  // Form Card
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterSuccess) {
                        final l10n = AppLocalizations.of(context)!;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.signupSuccess)),
                        );

                        // 👉 الانتقال لصفحة OTP
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AuthScopeLoginView();
                            },
                          ),
                        );
                      }

                      if (state is RegisterError) {
                        final l10n = AppLocalizations.of(context)!;
                        final text = switch (state.reason) {
                          AuthFailureReason.invalidCredentials =>
                            l10n.authErrorInvalidCredentials,
                          AuthFailureReason.emailTaken =>
                            l10n.authErrorEmailTaken,
                          AuthFailureReason.network => l10n.networkError,
                          AuthFailureReason.server => l10n.serverError,
                          AuthFailureReason.unknown => l10n.unexpectedError,
                        };
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(text)));
                      }
                    },
                    builder: (context, state) {
                      final isLoading = state is RegisterLoading;

                      return Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            FullNameField(
                              controller: _fullNameController,
                              onSaved: (value) => name = value ?? '',
                            ),
                            const SizedBox(height: 16),

                            EmailField(
                              controller: _emailController,
                              onSaved: (value) => email = value ?? '',
                            ),
                            const SizedBox(height: 16),

                            PasswordFieldWithRules(
                              controller: _passwordController,
                              onSaved: (value) => password = value ?? '',
                            ),
                            const SizedBox(height: 16),

                            ConfirmPasswordField(
                              passwordController: _passwordController,
                              controller: _confirmPasswordController,
                              onSaved: (value) => confirmPassword = value ?? '',
                            ),
                            const SizedBox(height: 20),

                            SignUpActionButton(
                              isLoading: isLoading,
                              formKey: _formKey,
                              onSubmit: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  context.read<RegisterCubit>().registerPatient(
                                    name: name,
                                    email: email,
                                    password: password,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  // Google Sign In Widget
                  const GoogleSignInWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
