import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/features/analysis/data/service/analysis_service.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisCardCubit/analysis_card_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  final AnalysisService service;

  AnalysisCubit(this.service) : super(AnalysisInitial());

  bool _loaded = false;

  Future<void> fetchAllAnalyses({bool forceRefresh = false}) async {
    if (_loaded && !forceRefresh) return;

    emit(AnalysisLoading());

    try {
      final analyses = await service.fetchAllAnalyses();

      if (isClosed) return;

      _loaded = true;

      emit(AnalysisSuccess(analyses));
    } on ApiException catch (e) {
      if (isClosed) return;
      emit(AnalysisError(e.userMessage));
    } catch (_) {
      if (isClosed) return;
      emit(AnalysisError("Something went wrong"));
    }
  }

  Future<void> fetchAnalyses(int categoryId) async {
    if (isClosed) return;

    emit(AnalysisLoading());

    try {
      final analyses = await service.fetchAnalysesByCategory(categoryId);

      if (isClosed) return;

      if (analyses.isEmpty) {
        emit(AnalysisEmpty());
      } else {
        emit(AnalysisSuccess(analyses));
      }
    } on ApiException catch (e) {
      if (isClosed) return;

      emit(AnalysisError(e.userMessage));
    } catch (_) {
      if (isClosed) return;

      emit(AnalysisError("حدث خطأ أثناء تحميل البيانات"));
    }
  }
}
