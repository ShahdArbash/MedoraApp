import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'select_analysis_state.dart';

class SelectAnalysisCubit extends Cubit<SelectAnalysisState> {
  SelectAnalysisCubit() : super(const SelectAnalysisState());

  /// بدء وضع التحديد
  void startSelection(int id) {
    emit(state.copyWith(selectionMode: true, selectedIds: {id}));
  }

  /// تحديد أو إلغاء تحديد تحليل
  void toggleSelection(int id) {
    final current = Set<int>.from(state.selectedIds);

    if (current.contains(id)) {
      current.remove(id);
    } else {
      current.add(id);
    }

    emit(
      state.copyWith(selectedIds: current, selectionMode: current.isNotEmpty),
    );
  }

  /// تغيير الفئة المختارة
  void selectCategory(int? categoryId) {
    emit(
      state.copyWith(
        selectedCategoryId: categoryId,
        resetCategory: categoryId == null,
      ),
    );
  }

  /// إلغاء جميع التحديدات
  void clearSelection() {
    emit(state.copyWith(selectedIds: {}, selectionMode: false));
  }

  /// هل التحليل محدد؟
  bool isSelected(int id) {
    return state.selectedIds.contains(id);
  }
}
