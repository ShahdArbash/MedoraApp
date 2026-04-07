import 'package:medoraapp/features/analysis/data/models/analysis_lab_model.dart';

class AnalysisLabsResponse {
  final List<AnalysisLabModel> labs;
  final int totalCount;
  final int filteredCount; // 👈 الجديد

  AnalysisLabsResponse({
    required this.labs,
    required this.totalCount,
    required this.filteredCount,
  });

  factory AnalysisLabsResponse.fromJson(Map<String, dynamic> json) {
    return AnalysisLabsResponse(
      labs: (json['data'] as List)
          .map((e) => AnalysisLabModel.fromJson(e))
          .toList(),
      totalCount: json['total_count'],
      filteredCount: json['filtered_count'], // 👈 لازم يرجع من الـ API
    );
  }
}
