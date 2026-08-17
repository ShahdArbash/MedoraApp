import 'package:medoraapp/features/appointments/data/models/appointment_model.dart';

enum AppointmentFilter { upcoming, previous }

abstract class AppointmentsState {}

class AppointmentsInitial extends AppointmentsState {}

class AppointmentsLoading extends AppointmentsState {}

class AppointmentsLoaded extends AppointmentsState {
  final List<AppointmentModel> upcoming;
  final List<AppointmentModel> past;
  final AppointmentFilter filter;

  AppointmentsLoaded({
    required this.upcoming,
    required this.past,
    required this.filter,
  });
}

class AppointmentsError extends AppointmentsState {
  final String message;

  AppointmentsError(this.message);
}
