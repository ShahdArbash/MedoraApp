import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/features/auth/data/models/register_request.dart';
import 'package:medoraapp/features/auth/data/services/auth_service.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthService authService;

  RegisterCubit(this.authService) : super(RegisterInitial());

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());

    try {
      final response = await authService.register(request);

      emit(RegisterSuccess(response));
    } on ApiException catch (e) {
      emit(RegisterError(e.userMessage));
    } catch (_) {
      emit(RegisterError("Something went wrong"));
    }
  }
}
