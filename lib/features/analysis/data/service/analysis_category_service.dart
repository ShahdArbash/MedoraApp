import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/error/api_exception.dart';
import '../models/analysis_category_model.dart';

class AnalysisCategoryService {
  final ApiClient apiClient = ApiClient();

  /// مؤقتاً لأن الباك اند غير جاهز
  static const bool useMock = true;

  Future<List<AnalysisCategoryModel>> fetchCategories() async {
    try {
      /// إذا كنا بوضع التجريب
      if (useMock) {
        await Future.delayed(const Duration(milliseconds: 600));

        return mockData.map((e) => AnalysisCategoryModel.fromJson(e)).toList();
      }

      /// عندما يصبح الباك اند جاهز
      final response = await apiClient.dio.get("analysis/categories");

      final List data = response.data;

      return data.map((e) => AnalysisCategoryModel.fromJson(e)).toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw const ApiException(type: ApiExceptionType.network);
      }

      if (e.response != null) {
        throw ApiException(
          type: ApiExceptionType.server,
          statusCode: e.response?.statusCode,
          serverMessage: e.response?.data["message"],
        );
      }

      throw const ApiException(type: ApiExceptionType.unknown);
    } catch (_) {
      throw const ApiException(type: ApiExceptionType.unknown);
    }
  }
}

final mockData = [
  {"id": 1, "name": "تحاليل الدم", "tests_count": 15, "icon": "bloodtype"},
  {"id": 2, "name": "الكيمياء الحيوية", "tests_count": 18, "icon": "science"},
  {"id": 3, "name": "الهرمونات", "tests_count": 12, "icon": "biotech"},
  {"id": 4, "name": "الأحياء الدقيقة", "tests_count": 10, "icon": "science"},
  {
    "id": 5,
    "name": "الفيروسات والمناعة",
    "tests_count": 8,
    "icon": "coronavirus",
  },
  {"id": 6, "name": "تحاليل البول", "tests_count": 9, "icon": "water_drop"},
  {
    "id": 7,
    "name": "تحاليل البراز",
    "tests_count": 7,
    "icon": "medical_services",
  },
  {"id": 8, "name": "التحاليل المناعية", "tests_count": 11, "icon": "shield"},
  {"id": 9, "name": "التحاليل الجينية", "tests_count": 5, "icon": "biotech"},
  {"id": 10, "name": "المعادن والعناصر", "tests_count": 6, "icon": "diamond"},
  {"id": 11, "name": "تحاليل القلب", "tests_count": 7, "icon": "favorite"},
  {"id": 12, "name": "تحاليل الحمل", "tests_count": 4, "icon": "child_care"},
  {"id": 13, "name": "تحاليل الحساسية", "tests_count": 5, "icon": "healing"},
];
