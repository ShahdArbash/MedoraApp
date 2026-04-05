import 'package:dio/dio.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/network/api_client.dart';
import '../models/analysis_model.dart';
import 'analysis_category_service.dart';

class AnalysisService {
  final ApiClient apiClient = ApiClient();

  Future<List<AnalysisModel>> fetchAnalysesByCategory(int categoryId) async {
    try {
      /// ✅ mock
      if (AnalysisCategoryService.useMock) {
        await Future.delayed(const Duration(milliseconds: 500));

        final mockData = [
          // ==== فئة: تحاليل الدم ====
          {
            "id": 1,
            "name": "تحليل صورة الدم كاملة (CBC)",
            "description":
                "فحص شامل لخلايا الدم الحمراء والبيضاء والصفائح الدموية",
            "category_id": 1,
          },
          {
            "id": 2,
            "name": "HbA1c",
            "description": "متوسط مستوى السكر في الدم لآخر 3 أشهر",
            "category_id": 1,
          },
          {
            "id": 3,
            "name": "الهيموغلوبين",
            "description": "قياس مستوى الهيموغلوبين في الدم",
            "category_id": 1,
          },
          {
            "id": 4,
            "name": "عداد الصفائح الدموية",
            "description": "قياس عدد الصفائح الدموية",
            "category_id": 1,
          },
          {
            "id": 5,
            "name": "خلايا الدم البيضاء",
            "description": "تقييم عدد ونوع خلايا الدم البيضاء",
            "category_id": 1,
          },

          // ==== فئة: الكيمياء الحيوية ====
          {
            "id": 6,
            "name": "جلوكوز الدم",
            "description": "قياس مستوى الغلوكوز في الدم",
            "category_id": 2,
          },
          {
            "id": 7,
            "name": "الكوليسترول",
            "description": "قياس مستوى الدهون في الدم",
            "category_id": 2,
          },
          {
            "id": 8,
            "name": "إنزيمات الكبد",
            "description": "تقييم وظائف الكبد",
            "category_id": 2,
          },
          {
            "id": 9,
            "name": "البوليناكريات",
            "description": "تقييم البروتينات في الدم",
            "category_id": 2,
          },
          {
            "id": 10,
            "name": "الكرياتينين",
            "description": "تقييم وظائف الكلى",
            "category_id": 2,
          },

          // ==== فئة: الهرمونات ====
          {
            "id": 11,
            "name": "TSH",
            "description": "تقييم وظيفة الغدة الدرقية",
            "category_id": 3,
          },
          {
            "id": 12,
            "name": "T3 و T4",
            "description": "قياس هرمونات الغدة الدرقية",
            "category_id": 3,
          },
          {
            "id": 13,
            "name": "الهرمون المنشط للجسم الأصفر (LH)",
            "description": "تقييم وظيفة الغدد التناسلية",
            "category_id": 3,
          },
          {
            "id": 14,
            "name": "FSH",
            "description": "هرمون الغدة النخامية المسؤول عن التكاثر",
            "category_id": 3,
          },
          {
            "id": 15,
            "name": "البرولاكتين",
            "description": "تقييم مستوى البرولاكتين في الدم",
            "category_id": 3,
          },

          // ==== فئة: الأحياء الدقيقة ====
          {
            "id": 16,
            "name": "زرع الدم",
            "description": "فحص وجود البكتيريا في الدم",
            "category_id": 4,
          },
          {
            "id": 17,
            "name": "زرع البول",
            "description": "كشف العدوى البكتيرية في البول",
            "category_id": 4,
          },
          {
            "id": 18,
            "name": "زرع البراز",
            "description": "تحديد البكتيريا الممرضة في البراز",
            "category_id": 4,
          },
          {
            "id": 19,
            "name": "مزرعة الحلق",
            "description": "كشف الالتهابات البكتيرية في الحلق",
            "category_id": 4,
          },
          {
            "id": 20,
            "name": "مزرعة الجرح",
            "description": "تحديد العدوى في الجروح",
            "category_id": 4,
          },

          // ==== فئة: الفيروسات والمناعة ====
          {
            "id": 21,
            "name": "فيروس C",
            "description": "اختبار وجود فيروس التهاب الكبد C",
            "category_id": 5,
          },
          {
            "id": 22,
            "name": "فيروس B",
            "description": "اختبار وجود فيروس التهاب الكبد B",
            "category_id": 5,
          },
          {
            "id": 23,
            "name": "HIV",
            "description": "فحص فيروس نقص المناعة البشرية",
            "category_id": 5,
          },
          {
            "id": 24,
            "name": "CRP",
            "description": "تقييم وجود التهابات في الجسم",
            "category_id": 5,
          },
          {
            "id": 25,
            "name": "Anti-HBs",
            "description": "تقييم المناعة ضد التهاب الكبد B",
            "category_id": 5,
          },

          // ==== فئة: تحاليل البول ====
          {
            "id": 26,
            "name": "تحليل البول العام",
            "description": "تقييم مكونات البول المختلفة",
            "category_id": 6,
          },
          {
            "id": 27,
            "name": "البروتين في البول",
            "description": "كشف البروتين في البول",
            "category_id": 6,
          },
          {
            "id": 28,
            "name": "سكر البول",
            "description": "فحص وجود الغلوكوز في البول",
            "category_id": 6,
          },
          {
            "id": 29,
            "name": "كريات الدم الحمراء في البول",
            "description": "تقييم وجود خلايا الدم الحمراء",
            "category_id": 6,
          },
          {
            "id": 30,
            "name": "كريات الدم البيضاء في البول",
            "description": "تقييم وجود خلايا الدم البيضاء",
            "category_id": 6,
          },

          // ==== فئة: تحاليل البراز ====
          {
            "id": 31,
            "name": "تحليل براز عام",
            "description": "تقييم مكونات البراز المختلفة",
            "category_id": 7,
          },
          {
            "id": 32,
            "name": "زرع البراز",
            "description": "كشف البكتيريا الممرضة في البراز",
            "category_id": 7,
          },
          {
            "id": 33,
            "name": "الطفيليات",
            "description": "تقييم وجود الطفيليات في البراز",
            "category_id": 7,
          },
          {
            "id": 34,
            "name": "دم مخفي في البراز",
            "description": "كشف وجود دم غير مرئي بالعين",
            "category_id": 7,
          },
          {
            "id": 35,
            "name": "الدهون في البراز",
            "description": "تقييم امتصاص الدهون في الجسم",
            "category_id": 7,
          },

          // ==== فئة: التحاليل المناعية ====
          {
            "id": 36,
            "name": "IgG",
            "description": "تقييم الأجسام المضادة IgG",
            "category_id": 8,
          },
          {
            "id": 37,
            "name": "IgM",
            "description": "تقييم الأجسام المضادة IgM",
            "category_id": 8,
          },
          {
            "id": 38,
            "name": "ANA",
            "description": "تقييم المناعة الذاتية",
            "category_id": 8,
          },
          {
            "id": 39,
            "name": "CRP",
            "description": "تقييم الالتهابات في الجسم",
            "category_id": 8,
          },
          {
            "id": 40,
            "name": "Anti-dsDNA",
            "description": "اختبار الأجسام المضادة للحمض النووي",
            "category_id": 8,
          },

          {
            "id": 1,
            "name": "تحليل صورة الدم كاملة (CBC)",
            "description": "فحص شامل لخلايا الدم",
            "category_id": 1,
          },
          {
            "id": 2,
            "name": "الهيموغلوبين",
            "description": "قياس نسبة الهيموغلوبين",
            "category_id": 1,
          },
          {
            "id": 3,
            "name": "الهيماتوكريت",
            "description": "قياس نسبة خلايا الدم",
            "category_id": 1,
          },
          {
            "id": 4,
            "name": "الصفائح الدموية",
            "description": "تقييم تخثر الدم",
            "category_id": 1,
          },
          {
            "id": 5,
            "name": "خلايا الدم البيضاء",
            "description": "تقييم المناعة",
            "category_id": 1,
          },
          {
            "id": 6,
            "name": "خلايا الدم الحمراء",
            "description": "قياس عدد RBC",
            "category_id": 1,
          },
          {
            "id": 7,
            "name": "MCV",
            "description": "حجم كريات الدم",
            "category_id": 1,
          },
          {
            "id": 8,
            "name": "MCH",
            "description": "كمية الهيموغلوبين",
            "category_id": 1,
          },
          {
            "id": 9,
            "name": "MCHC",
            "description": "تركيز الهيموغلوبين",
            "category_id": 1,
          },
          {
            "id": 10,
            "name": "RDW",
            "description": "توزع كريات الدم",
            "category_id": 1,
          },

          // ================= الكيمياء الحيوية =================
          {
            "id": 11,
            "name": "سكر الدم",
            "description": "قياس الغلوكوز",
            "category_id": 2,
          },
          {
            "id": 12,
            "name": "HbA1c",
            "description": "متوسط السكر 3 أشهر",
            "category_id": 2,
          },
          {
            "id": 13,
            "name": "الكوليسترول الكلي",
            "description": "مستوى الدهون",
            "category_id": 2,
          },
          {
            "id": 14,
            "name": "LDL",
            "description": "الكوليسترول الضار",
            "category_id": 2,
          },
          {
            "id": 15,
            "name": "HDL",
            "description": "الكوليسترول الجيد",
            "category_id": 2,
          },
          {
            "id": 16,
            "name": "Triglycerides",
            "description": "الدهون الثلاثية",
            "category_id": 2,
          },
          {
            "id": 17,
            "name": "الكرياتينين",
            "description": "وظائف الكلى",
            "category_id": 2,
          },
          {
            "id": 18,
            "name": "اليوريا",
            "description": "تقييم الكلى",
            "category_id": 2,
          },
          {
            "id": 19,
            "name": "ALT",
            "description": "إنزيمات الكبد",
            "category_id": 2,
          },
          {
            "id": 20,
            "name": "AST",
            "description": "وظائف الكبد",
            "category_id": 2,
          },

          // ================= الهرمونات =================
          {
            "id": 21,
            "name": "TSH",
            "description": "الغدة الدرقية",
            "category_id": 3,
          },
          {
            "id": 22,
            "name": "T3",
            "description": "هرمون الغدة الدرقية",
            "category_id": 3,
          },
          {
            "id": 23,
            "name": "T4",
            "description": "هرمون الغدة الدرقية",
            "category_id": 3,
          },
          {
            "id": 24,
            "name": "FSH",
            "description": "هرمون الخصوبة",
            "category_id": 3,
          },
          {
            "id": 25,
            "name": "LH",
            "description": "هرمون التبويض",
            "category_id": 3,
          },
          {
            "id": 26,
            "name": "البرولاكتين",
            "description": "هرمون الحليب",
            "category_id": 3,
          },
          {
            "id": 27,
            "name": "الكورتيزول",
            "description": "هرمون التوتر",
            "category_id": 3,
          },
          {
            "id": 28,
            "name": "التستوستيرون",
            "description": "هرمون الذكورة",
            "category_id": 3,
          },
          {
            "id": 29,
            "name": "الإستروجين",
            "description": "هرمون الأنوثة",
            "category_id": 3,
          },
          {
            "id": 30,
            "name": "Progesterone",
            "description": "هرمون الحمل",
            "category_id": 3,
          },

          // ================= الأحياء الدقيقة =================
          {
            "id": 31,
            "name": "زرع الدم",
            "description": "كشف البكتيريا",
            "category_id": 4,
          },
          {
            "id": 32,
            "name": "زرع البول",
            "description": "كشف العدوى",
            "category_id": 4,
          },
          {
            "id": 33,
            "name": "زرع البراز",
            "description": "كشف الجراثيم",
            "category_id": 4,
          },
          {
            "id": 34,
            "name": "مزرعة الحلق",
            "description": "التهابات الحلق",
            "category_id": 4,
          },
          {
            "id": 35,
            "name": "مزرعة الجروح",
            "description": "كشف الالتهابات",
            "category_id": 4,
          },
          {
            "id": 36,
            "name": "Gram stain",
            "description": "فحص البكتيريا",
            "category_id": 4,
          },
          {"id": 37, "name": "AFB", "description": "السل", "category_id": 4},
          {
            "id": 38,
            "name": "Culture sensitivity",
            "description": "اختبار المضادات",
            "category_id": 4,
          },
          {
            "id": 39,
            "name": "PCR بكتيري",
            "description": "تحليل جيني للبكتيريا",
            "category_id": 4,
          },
          {
            "id": 40,
            "name": "Rapid test",
            "description": "اختبار سريع",
            "category_id": 4,
          },

          // ================= الفيروسات والمناعة =================
          {
            "id": 41,
            "name": "HIV",
            "description": "فيروس نقص المناعة",
            "category_id": 5,
          },
          {
            "id": 42,
            "name": "HBsAg",
            "description": "التهاب الكبد B",
            "category_id": 5,
          },
          {
            "id": 43,
            "name": "HCV",
            "description": "التهاب الكبد C",
            "category_id": 5,
          },
          {
            "id": 44,
            "name": "COVID-19",
            "description": "فيروس كورونا",
            "category_id": 5,
          },
          {
            "id": 45,
            "name": "CRP",
            "description": "الالتهابات",
            "category_id": 5,
          },
          {
            "id": 46,
            "name": "ESR",
            "description": "سرعة الترسيب",
            "category_id": 5,
          },
          {
            "id": 47,
            "name": "D-dimer",
            "description": "التجلطات",
            "category_id": 5,
          },
          {
            "id": 48,
            "name": "Ferritin",
            "description": "مخزون الحديد",
            "category_id": 5,
          },
          {
            "id": 49,
            "name": "IgG",
            "description": "مناعة طويلة",
            "category_id": 5,
          },
          {
            "id": 50,
            "name": "IgM",
            "description": "مناعة حديثة",
            "category_id": 5,
          },

          // ================= البول =================
          {
            "id": 51,
            "name": "تحليل بول عام",
            "description": "فحص شامل",
            "category_id": 6,
          },
          {
            "id": 52,
            "name": "سكر البول",
            "description": "كشف السكري",
            "category_id": 6,
          },
          {
            "id": 53,
            "name": "بروتين البول",
            "description": "مشاكل الكلى",
            "category_id": 6,
          },
          {
            "id": 54,
            "name": "كريات الدم",
            "description": "نزيف",
            "category_id": 6,
          },
          {
            "id": 55,
            "name": "الكيتونات",
            "description": "حرق الدهون",
            "category_id": 6,
          },
          {
            "id": 56,
            "name": "pH البول",
            "description": "حموضة البول",
            "category_id": 6,
          },
          {
            "id": 57,
            "name": "كثافة البول",
            "description": "تركيز البول",
            "category_id": 6,
          },
          {
            "id": 58,
            "name": "Nitrite",
            "description": "عدوى بكتيرية",
            "category_id": 6,
          },
          {
            "id": 59,
            "name": "Leukocytes",
            "description": "التهاب",
            "category_id": 6,
          },
          {
            "id": 60,
            "name": "Bilirubin",
            "description": "مشاكل الكبد",
            "category_id": 6,
          },

          // ================= البراز =================
          {
            "id": 61,
            "name": "تحليل براز عام",
            "description": "فحص شامل",
            "category_id": 7,
          },
          {
            "id": 62,
            "name": "الطفيليات",
            "description": "كشف الديدان",
            "category_id": 7,
          },
          {
            "id": 63,
            "name": "دم مخفي",
            "description": "نزيف داخلي",
            "category_id": 7,
          },
          {
            "id": 64,
            "name": "زرع البراز",
            "description": "البكتيريا",
            "category_id": 7,
          },
          {
            "id": 65,
            "name": "دهون البراز",
            "description": "امتصاص الدهون",
            "category_id": 7,
          },
          {
            "id": 66,
            "name": "PH البراز",
            "description": "حموضة",
            "category_id": 7,
          },
          {
            "id": 67,
            "name": "WBC بالبراز",
            "description": "التهاب",
            "category_id": 7,
          },
          {"id": 68, "name": "Mucus", "description": "مخاط", "category_id": 7},
          {
            "id": 69,
            "name": "Rotavirus",
            "description": "فيروس",
            "category_id": 7,
          },
          {
            "id": 70,
            "name": "Occult blood",
            "description": "دم خفي",
            "category_id": 7,
          },

          // ================= المناعة =================
          {
            "id": 71,
            "name": "IgA",
            "description": "مناعة مخاطية",
            "category_id": 8,
          },
          {"id": 72, "name": "IgE", "description": "حساسية", "category_id": 8},
          {
            "id": 73,
            "name": "ANA",
            "description": "مناعة ذاتية",
            "category_id": 8,
          },
          {
            "id": 74,
            "name": "Anti-DNA",
            "description": "أمراض مناعية",
            "category_id": 8,
          },
          {
            "id": 75,
            "name": "RF",
            "description": "الروماتويد",
            "category_id": 8,
          },
          {
            "id": 76,
            "name": "CRP",
            "description": "التهابات",
            "category_id": 8,
          },
          {
            "id": 77,
            "name": "Complement C3",
            "description": "مناعة",
            "category_id": 8,
          },
          {
            "id": 78,
            "name": "Complement C4",
            "description": "مناعة",
            "category_id": 8,
          },
          {
            "id": 79,
            "name": "Anti-CCP",
            "description": "روماتويد",
            "category_id": 8,
          },
          {
            "id": 80,
            "name": "ESR",
            "description": "التهابات",
            "category_id": 8,
          },
        ];

        return mockData
            .where((e) => e["category_id"] == categoryId)
            .map((e) => AnalysisModel.fromJson(e))
            .toList();
      }

      /// ✅ API
      final response = await apiClient.dio.get(
        "analyses",
        queryParameters: {"category_id": categoryId},
      );

      final List data = response.data;

      return data.map((e) => AnalysisModel.fromJson(e)).toList();
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
