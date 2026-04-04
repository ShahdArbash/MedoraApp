import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/api_exception.dart';
import '../../../data/models/analysis_category_model.dart';
import '../../../data/service/analysis_service.dart';

part 'analysis_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  final AnalysisService service;

  AnalysisCubit({required this.service}) : super(AnalysisInitial());

  Future<void> getCategories() async {
    emit(AnalysisLoading());
    try {
      final data = await service.fetchCategories();

      emit(AnalysisLoaded(data));
    } on ApiException catch (e) {
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
      emit(AnalysisError("خطأ غير معروف"));
    }
  }
}
