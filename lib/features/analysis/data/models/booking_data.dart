class BookingData {
  final String analysisName;
  final String labName;
  final double price;
  final String? location;
  final String? duration;

  BookingData({
    required this.analysisName,
    required this.labName,
    required this.price,
    this.location,
    this.duration,
  });
}
