import 'package:medoraapp/features/appointment/data/models/time_model.dart';

abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentLoaded extends AppointmentState {
  final List<TimeModel> times;

  AppointmentLoaded(this.times);
}

class AppointmentError extends AppointmentState {
  final String message;

  AppointmentError(this.message);
}
