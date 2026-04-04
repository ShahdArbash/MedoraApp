import 'package:bloc/bloc.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/features/auth/auth_failure_reason.dart';
import 'package:medoraapp/features/auth/data/models/login_response_model.dart';
import 'package:medoraapp/features/auth/data/services/auth_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService authService;

  LoginCubit(this.authService) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final response = await authService.loginPatient(
        email: email,
        password: password,
      );

      if (response.isSuccess) {
        emit(LoginSuccess(response));
      } else {
        emit(LoginError(mapAuthFailureReason(serverMessage: response.message)));
      }
    } on ApiException catch (e) {
      emit(LoginError(mapAuthFailureReason(exception: e)));
    } catch (e) {
      emit(LoginError(AuthFailureReason.unknown));
    }
  }
}
