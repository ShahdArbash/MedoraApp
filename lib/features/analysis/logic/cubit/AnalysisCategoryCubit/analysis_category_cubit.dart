import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/api_exception.dart';
import '../../../data/models/analysis_category_model.dart';
import '../../../data/service/analysis_category_service.dart';

part 'analysis_category_state.dart';

class AnalysisCategoryCubit extends Cubit<AnalysisCategoryState> {
  final AnalysisCategoryService service;

  AnalysisCategoryCubit({required this.service})
    : super(AnalysisCategoryInitial());

  Future<void> getCategories() async {
    if (isClosed) return;

    emit(AnalysisCategoryLoading());

    try {
      final data = await service.fetchCategories();

      if (isClosed) return;

      emit(AnalysisCategorySuccess(data));
    } on ApiException catch (e) {
      if (isClosed) return;

      emit(AnalysisCategoryFailure(e.userMessage));
    } catch (_) {
      if (isClosed) return;

      emit(AnalysisCategoryFailure("Something went wrong"));
    }
  }
}
