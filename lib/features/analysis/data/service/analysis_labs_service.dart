import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/analysis/data/models/analysis_lab_model.dart';
import 'package:medoraapp/features/analysis/data/models/analysis_labs_response.dart';

class AnalysisLabsService {
  final ApiClient apiClient = ApiClient();

  static const bool useMock = true;

  Future<AnalysisLabsResponse> fetchLabs(int analysisId) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 600));

      final labsData =
          mockLabsByAnalysis[analysisId] ?? mockLabsByAnalysis.values.first;

      final labs = labsData.map((e) => AnalysisLabModel.fromJson(e)).toList();

      return AnalysisLabsResponse(
        labs: labs,
        totalCount: labs.length,
        filteredCount: labs.length,
      );
    }

    final response = await apiClient.dio.get(
      "analysis/labs",
      queryParameters: {"analysis_id": analysisId},
    );

    return AnalysisLabsResponse.fromJson(response.data);
  }
}

final Map<int, List<Map<String, dynamic>>> mockLabsByAnalysis = {
  1: [
    {
      "id": 1,
      "analysis_id": 1,
      "lab_name": "مخبر ألفا",
      "location": "المزة",
      "price": 18,
      "old_price": null,
      "rating": 4.5,
      "duration": "24 ساعة",
      "has_offer": false,
    },
    {
      "id": 2,
      "analysis_id": 1,
      "lab_name": "مخبر الشفاء",
      "location": "المالكي",
      "price": 20,
      "old_price": 30,
      "rating": 4.7,
      "duration": "24 ساعة",
      "has_offer": true,
    },
    {
      "id": 3,
      "analysis_id": 1,
      "lab_name": "مخبر النور",
      "location": "كفرسوسة",
      "price": 22,
      "old_price": null,
      "rating": 4.3,
      "duration": "48 ساعة",
      "has_offer": false,
    },
    {
      "id": 4,
      "analysis_id": 1,
      "lab_name": "مخبر الحياة",
      "location": "أبو رمانة",
      "price": 19,
      "old_price": 25,
      "rating": 4.6,
      "duration": "24 ساعة",
      "has_offer": true,
    },
  ],
};
