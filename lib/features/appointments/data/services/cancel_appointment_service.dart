import 'package:medoraapp/core/network/api_client.dart';

class CancelAppointmentService {
  final apiClient = ApiClient().dio;

  Future<void> cancelAppointment(int appointmentId) async {
    await apiClient.post("appointments/$appointmentId/cancel");
  }
}
