import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/api_exception.dart';
import '../../../data/models/analysis_category_model.dart';
import '../../../data/service/analysis_category_service.dart';

part 'analysis_category_state.dart';

class AnalysisCategoryCubit extends Cubit<AnalysisCategoryState> {
  final AnalysisCategoryService service;

  AnalysisCategoryCubit({required this.service}) : super(AnalysisInitial());
  Future<void> getCategories() async {
    if (isClosed) return;

    emit(AnalysisLoading());

    try {
      final data = await service.fetchCategories();

      if (isClosed) return; // 👈 أهم سطر

      emit(AnalysisLoaded(data));
    } on ApiException catch (e) {
      if (isClosed) return;

      switch (e.type) {
        case ApiExceptionType.network:
          emit(AnalysisError("تحقق من اتصال الإنترنت"));
          break;

        case ApiExceptionType.server:
          emit(AnalysisError("خطأ في السيرفر"));
          break;

        case ApiExceptionType.unknown:
          emit(AnalysisError("حدث خطأ غير متوقع"));
          break;
      }
    } catch (_) {
      if (isClosed) return;

      emit(AnalysisError("خطأ غير معروف"));
    }
  }
}
