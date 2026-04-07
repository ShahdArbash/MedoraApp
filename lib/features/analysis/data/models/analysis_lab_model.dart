class AnalysisLabModel {
  final int id;
  final String labName;
  final String location;
  final double price;
  final double? oldPrice;
  final double rating;
  final String duration;
  final bool hasOffer;

  AnalysisLabModel({
    required this.id,
    required this.labName,
    required this.location,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.duration,
    required this.hasOffer,
  });

  factory AnalysisLabModel.fromJson(Map<String, dynamic> json) {
    return AnalysisLabModel(
      id: json['id'],
      labName: json['lab_name'],
      location: json['location'],
      price: (json['price'] as num).toDouble(),
      oldPrice: json['old_price'] != null
          ? (json['old_price'] as num).toDouble()
          : null,
      rating: (json['rating'] as num).toDouble(),
      duration: json['duration'],
      hasOffer: json['has_offer'] ?? false,
    );
  }
}
