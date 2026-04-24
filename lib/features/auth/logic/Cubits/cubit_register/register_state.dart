import 'package:medoraapp/features/auth/data/models/register_response_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterResponseModel data;

  RegisterSuccess(this.data);
}

class RegisterError extends RegisterState {
  final String message;

  RegisterError(this.message);
}
