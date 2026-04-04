part of 'analysis_cubit.dart';

abstract class AnalysisState {}

class AnalysisInitial extends AnalysisState {}

class AnalysisLoading extends AnalysisState {}

class AnalysisLoaded extends AnalysisState {
  final List<AnalysisCategoryModel> categories;

  AnalysisLoaded(this.categories);
}

class AnalysisError extends AnalysisState {
  final String message;

  AnalysisError(this.message);
}
