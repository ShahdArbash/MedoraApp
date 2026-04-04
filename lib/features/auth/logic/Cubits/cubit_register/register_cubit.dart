import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/features/auth/auth_failure_reason.dart';
import 'package:medoraapp/features/auth/data/services/auth_service.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthService authService;

  RegisterCubit(this.authService) : super(RegisterInitial());

  Future<void> registerPatient({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());

    try {
      final response = await authService.registerPatient(
        name: name,
        email: email,
        password: password,
      );

      if (response.isSuccess) {
        emit(RegisterSuccess());
      } else {
        emit(
          RegisterError(mapAuthFailureReason(serverMessage: response.message)),
        );
      }
    } on ApiException catch (e) {
      emit(RegisterError(mapAuthFailureReason(exception: e)));
    } catch (e) {
      emit(RegisterError(AuthFailureReason.unknown));
    }
  }
}
