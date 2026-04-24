import 'package:medoraapp/features/appointment/data/models/time_model.dart';
import 'package:medoraapp/features/appointment/data/service/appointment_service.dart';

class AppointmentRepository {
  final AppointmentService service;

  AppointmentRepository(this.service);

  Future<List<TimeModel>> getTimes({
    required int labId,
    required int analysisId,
    required String date,
  }) {
    return service.fetchTimes(labId: labId, analysisId: analysisId, date: date);
  }
}
