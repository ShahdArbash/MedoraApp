enum AppointmentType { upcoming, past }

class AppointmentModel {
  final int id;
  final String labName;
  final String address;
  final String date;
  final String time;
  final String status;
  final String testname;
  final AppointmentType type;

  AppointmentModel({
    required this.id,
    required this.labName,
    required this.address,
    required this.date,
    required this.time,
    required this.status,

    required this.type,
    required this.testname,
  });

  factory AppointmentModel.fromJson(
    Map<String, dynamic> json,
    AppointmentType type,
  ) {
    final tests = json["lab_tests"] as List? ?? [];

    return AppointmentModel(
      id: json["id"] ?? 0,

      labName: json["lab"]?["name"] ?? "",

      address: json["lab"]?["address"] ?? "",

      date: json["appointment_date"] ?? "",

      time: json["start_time"] ?? "",

      status: json["status"] ?? "",
      testname: 'تحليل تعداد الدم ',

      type: type,
    );
  }
}
