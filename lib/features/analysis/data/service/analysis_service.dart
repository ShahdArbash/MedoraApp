import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/error/api_exception.dart';
import '../models/analysis_category_model.dart';

class AnalysisService {
  final ApiClient apiClient = ApiClient();

  /// مؤقتاً لأن الباك اند غير جاهز
  static const bool useMock = true;

  Future<List<AnalysisCategoryModel>> fetchCategories() async {
    try {
      /// إذا كنا بوضع التجريب
      if (useMock) {
        await Future.delayed(const Duration(milliseconds: 600));

        final mockData = [
          {
            "id": 1,
            "name": "تحاليل الدم",
            "tests_count": 15,
            "icon_code": 0xe3f5, // bloodtype
            "icon_family": "MaterialIcons",
          },
          {
            "id": 2,
            "name": "الكيمياء الحيوية",
            "tests_count": 18,
            "icon_code": 0xe30a, // science
            "icon_family": "MaterialIcons",
          },
          {
            "id": 3,
            "name": "الهرمونات",
            "tests_count": 12,
            "icon_code": 0xe3b0, // biotech
            "icon_family": "MaterialIcons",
          },
          {
            "id": 4,
            "name": "الأحياء الدقيقة",
            "tests_count": 10,
            "icon_code": 0xe30a, // science (أفضل تمثيل)
            "icon_family": "MaterialIcons",
          },
          {
            "id": 5,
            "name": "الفيروسات والمناعة",
            "tests_count": 8,
            "icon_code": 0xe1ff, // coronavirus
            "icon_family": "MaterialIcons",
          },
          {
            "id": 6,
            "name": "تحاليل البول",
            "tests_count": 9,
            "icon_code": 0xf053, // water_drop
            "icon_family": "MaterialIcons",
          },
          {
            "id": 7,
            "name": "تحاليل البراز",
            "tests_count": 7,
            "icon_code": 0xe23b, // medical_services
            "icon_family": "MaterialIcons",
          },
          {
            "id": 8,
            "name": "التحاليل المناعية",
            "tests_count": 11,
            "icon_code": 0xe9e0, // shield
            "icon_family": "MaterialIcons",
          },
          {
            "id": 9,
            "name": "التحاليل الجينية",
            "tests_count": 5,
            "icon_code": 0xe3b0, // biotech (DNA-like)
            "icon_family": "MaterialIcons",
          },
          {
            "id": 10,
            "name": "المعادن والعناصر",
            "tests_count": 6,
            "icon_code": 0xe3a5, // diamond
            "icon_family": "MaterialIcons",
          },
          {
            "id": 11,
            "name": "تحاليل القلب",
            "tests_count": 7,
            "icon_code": 0xe87d, // favorite
            "icon_family": "MaterialIcons",
          },
          {
            "id": 12,
            "name": "تحاليل الحمل",
            "tests_count": 4,
            "icon_code": 0xe91d, // child_care
            "icon_family": "MaterialIcons",
          },
          {
            "id": 13,
            "name": "تحاليل الحساسية",
            "tests_count": 5,
            "icon_code": 0xe3a9, // healing
            "icon_family": "MaterialIcons",
          },
        ];
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
