part of 'select_analysis_cubit.dart';

class SelectAnalysisState extends Equatable {
  final Set<int> selectedIds;

  final bool selectionMode;

  /// null تعني "الكل"
  final int? selectedCategoryId;

  const SelectAnalysisState({
    this.selectedIds = const {},
    this.selectionMode = false,
    this.selectedCategoryId,
  });

  @override
  List<Object?> get props => [selectedIds, selectionMode, selectedCategoryId];

  SelectAnalysisState copyWith({
    Set<int>? selectedIds,
    bool? selectionMode,

    /// استخدم resetCategory=true لإرجاعها إلى null
    int? selectedCategoryId,
    bool resetCategory = false,
  }) {
    return SelectAnalysisState(
      selectedIds: selectedIds ?? this.selectedIds,
      selectionMode: selectionMode ?? this.selectionMode,
      selectedCategoryId: resetCategory
          ? null
          : selectedCategoryId ?? this.selectedCategoryId,
    );
  }
}
