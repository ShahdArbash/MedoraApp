import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/analysis/data/service/analysis_service.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisCardCubit/analysis_card_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  final AnalysisService service;

  AnalysisCubit(this.service) : super(AnalysisInitial());

  Future<void> fetchAnalyses(int categoryId) async {
    emit(AnalysisLoading());

    try {
      final analyses = await service.fetchAnalysesByCategory(categoryId);

      if (analyses.isEmpty) {
        emit(AnalysisError("لا يوجد تحاليل لهذه الفئة"));
      } else {
        emit(AnalysisSuccess(analyses));
      }
    } catch (e) {
      emit(AnalysisError("حدث خطأ أثناء تحميل البيانات"));
    }
  }
}
