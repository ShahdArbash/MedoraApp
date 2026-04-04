import 'package:medoraapp/features/auth/auth_failure_reason.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  RegisterSuccess();
}

class RegisterError extends RegisterState {
  final AuthFailureReason reason;
  RegisterError(this.reason);
}
