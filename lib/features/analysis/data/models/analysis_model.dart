class AnalysisModel {
  final int id;
  final String name;
  final String description;

  AnalysisModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory AnalysisModel.fromJson(Map<String, dynamic> json) {
    return AnalysisModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
