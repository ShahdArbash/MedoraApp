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
      "lab_name": "مخبر النور",
      "location": "كفرسوسة",
      "price": 22,
      "old_price": null,
      "rating": 4.3,
      "duration": "48 ساعة",
      "has_offer": false,
    },
  ],

  2: [
    {
      "id": 4,
      "lab_name": "مخبر السلام",
      "location": "القصاع",
      "price": 15,
      "old_price": 25,
      "rating": 4.6,
      "duration": "12 ساعة",
      "has_offer": true,
    },
    {
      "id": 5,
      "lab_name": "مخبر الرحمة",
      "location": "الميدان",
      "price": 17,
      "old_price": null,
      "rating": 4.4,
      "duration": "24 ساعة",
      "has_offer": false,
    },
    {
      "id": 6,
      "lab_name": "مخبر البركة",
      "location": "ركن الدين",
      "price": 16,
      "old_price": null,
      "rating": 4.2,
      "duration": "24 ساعة",
      "has_offer": false,
    },
    {
      "id": 7,
      "lab_name": "مخبر الريادة",
      "location": "جرمانا",
      "price": 19,
      "old_price": 28,
      "rating": 4.8,
      "duration": "12 ساعة",
      "has_offer": true,
    },
  ],

  3: [
    {
      "id": 8,
      "lab_name": "مخبر الخبراء",
      "location": "البرامكة",
      "price": 30,
      "old_price": null,
      "rating": 4.6,
      "duration": "24 ساعة",
      "has_offer": false,
    },
    {
      "id": 9,
      "lab_name": "مخبر الجودة",
      "location": "المزة",
      "price": 28,
      "old_price": 35,
      "rating": 4.7,
      "duration": "12 ساعة",
      "has_offer": true,
    },
    {
      "id": 10,
      "lab_name": "مخبر العاصمة",
      "location": "أبو رمانة",
      "price": 32,
      "old_price": null,
      "rating": 4.9,
      "duration": "12 ساعة",
      "has_offer": false,
    },
    {
      "id": 11,
      "lab_name": "مخبر الشامل",
      "location": "صحنايا",
      "price": 27,
      "old_price": null,
      "rating": 4.3,
      "duration": "24 ساعة",
      "has_offer": false,
    },
    {
      "id": 12,
      "lab_name": "مخبر الرعاية",
      "location": "داريا",
      "price": 26,
      "old_price": 33,
      "rating": 4.5,
      "duration": "24 ساعة",
      "has_offer": true,
    },
  ],
};
