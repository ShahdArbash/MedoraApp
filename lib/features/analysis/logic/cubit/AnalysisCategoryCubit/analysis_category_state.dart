part of 'analysis_category_cubit.dart';

abstract class AnalysisCategoryState {}

class AnalysisInitial extends AnalysisCategoryState {}

class AnalysisLoading extends AnalysisCategoryState {}

class AnalysisLoaded extends AnalysisCategoryState {
  final List<AnalysisCategoryModel> categories;

  AnalysisLoaded(this.categories);
}

class AnalysisError extends AnalysisCategoryState {
  final String message;

  AnalysisError(this.message);
}
