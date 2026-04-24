import 'package:bloc/bloc.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/features/auth/data/models/login_request.dart';
import 'package:medoraapp/features/auth/data/models/login_response_model.dart';
import 'package:medoraapp/features/auth/data/services/auth_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService authService;

  LoginCubit(this.authService) : super(LoginInitial());

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());

    try {
      final response = await authService.login(request);
      emit(LoginSuccess(response));
    } on ApiException catch (e) {
      emit(LoginError(e.userMessage));
    } catch (_) {
      emit(LoginError("Something went wrong"));
    }
  }
}
