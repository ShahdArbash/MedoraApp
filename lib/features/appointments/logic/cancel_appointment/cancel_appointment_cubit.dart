import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/appointments/data/services/cancel_appointment_service.dart';
import 'cancel_appointment_state.dart';

class CancelAppointmentCubit extends Cubit<CancelAppointmentState> {
  final CancelAppointmentService service;

  CancelAppointmentCubit(this.service) : super(CancelAppointmentInitial());

  Future<void> cancelAppointment(int appointmentId) async {
    emit(CancelAppointmentLoading());

    try {
      await service.cancelAppointment(appointmentId);

      emit(CancelAppointmentSuccess());
    } catch (e) {
      print("Cancel Appointment Error: $e");

      emit(CancelAppointmentError("تعذر إلغاء الموعد"));
    }
  }
}
