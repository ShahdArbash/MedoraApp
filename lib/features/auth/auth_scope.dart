import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_login/login_cubit.dart';
import 'package:medoraapp/features/auth/data/services/api_service.dart';
import 'package:medoraapp/features/auth/data/services/auth_service.dart';
import 'package:medoraapp/features/auth/presentation/views/login_view.dart';

class AuthScopeLoginView extends StatelessWidget {
  const AuthScopeLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(AuthService(ApiService())),
      child: LoginView(),
    );
  }
}
