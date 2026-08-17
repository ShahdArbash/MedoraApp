import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/setting&profile/data/service/logout_service.dart';

part 'logout_states.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutService logoutService;

  LogoutCubit(this.logoutService) : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());

    try {
      await logoutService.logout();

      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutError(e.toString()));
    }
  }
}
