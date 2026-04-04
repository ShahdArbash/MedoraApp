part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseModel response;
  LoginSuccess(this.response);
}

class LoginError extends LoginState {
  final AuthFailureReason reason;
  LoginError(this.reason);
}
