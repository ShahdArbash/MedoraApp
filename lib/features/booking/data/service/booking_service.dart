import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/booking/data/models/Request%20Model/booking_api_request.dart';
import 'package:medoraapp/features/booking/data/models/View%20Model/time_model.dart';

class BookingService {
  final apiClient = ApiClient().dio;
  Future<List<TimeModel>> fetchTimes({
    required int labId,
    required String date,
  }) async {
    final response = await apiClient.get(
      "laboratories/$labId/slots",
      queryParameters: {"date": date},
    );

    final List data = response.data['data'];

    return data.map((e) => TimeModel.fromJson(e)).toList();
  }

  Future<void> bookAppointment(BookingApiRequest request) async {
    await apiClient.post("appointments", data: request.toJson());
  }
}
