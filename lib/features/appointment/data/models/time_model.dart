class TimeModel {
  final String time;
  final bool isAvailable;

  TimeModel({required this.time, required this.isAvailable});

  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(time: json['time'], isAvailable: json['is_available']);
  }
}
