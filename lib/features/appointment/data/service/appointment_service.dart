import 'package:medoraapp/features/appointment/data/models/time_model.dart';

class AppointmentService {
  Future<List<TimeModel>> fetchTimes({
    required int labId,
    required int analysisId,
    required String date,
  }) async {
    /// 🔥 هون بتحطي API تبع Laravel
    /// مثال:
    /// GET /labs/{labId}/times?analysis_id=1&date=2026-04-20

    await Future.delayed(const Duration(seconds: 1));

    /// 🔥 Mock حالياً
    return [
      TimeModel(time: "09:00", isAvailable: true),
      TimeModel(time: "10:00", isAvailable: false),
      TimeModel(time: "11:30", isAvailable: true),
    ];
  }
}
