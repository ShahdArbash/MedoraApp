class BookingData {
  final int labId;
  final int analysisId;
  final String analysisName;
  final String labName;
  final double price;
  final String? location;
  final String? duration;

  BookingData({
    required this.labId,
    required this.analysisId,
    required this.analysisName,
    required this.labName,
    required this.price,
    this.location,
    this.duration,
  });
}
