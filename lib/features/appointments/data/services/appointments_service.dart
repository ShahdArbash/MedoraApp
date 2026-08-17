import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/appointments/data/models/appointments_response.dart';

class AppointmentsService {
  final apiClient = ApiClient().dio;

  Future<AppointmentsResponse> fetchAppointments() async {
    final response = await apiClient.get("appointments");

    return AppointmentsResponse.fromJson(response.data);
  }
}
