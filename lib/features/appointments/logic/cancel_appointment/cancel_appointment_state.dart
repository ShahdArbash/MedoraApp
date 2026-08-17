abstract class CancelAppointmentState {}

class CancelAppointmentInitial extends CancelAppointmentState {}

class CancelAppointmentLoading extends CancelAppointmentState {}

class CancelAppointmentSuccess extends CancelAppointmentState {}

class CancelAppointmentError extends CancelAppointmentState {
  final String message;

  CancelAppointmentError(this.message);
}
