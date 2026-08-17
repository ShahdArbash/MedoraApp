import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/appointments/data/models/appointments_response.dart';
import 'package:medoraapp/features/appointments/data/services/appointments_service.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  final AppointmentsService service;

  AppointmentsCubit(this.service) : super(AppointmentsInitial());

  Future<void> getAppointments() async {
    emit(AppointmentsLoading());

    try {
      final response = await service.fetchAppointments();

      emit(
        AppointmentsLoaded(
          upcoming: response.upcoming,
          past: response.past,
          filter: AppointmentFilter.upcoming,
        ),
      );
    } catch (e) {
      print("Get Appointments Error: $e");

      emit(AppointmentsError("حدث خطأ"));
    }
  }

  void changeTab(AppointmentFilter filter) {
    final currentState = state;

    if (currentState is AppointmentsLoaded) {
      emit(
        AppointmentsLoaded(
          upcoming: currentState.upcoming,
          past: currentState.past,
          filter: filter,
        ),
      );
    }
  }
}
