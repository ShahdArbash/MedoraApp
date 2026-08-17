part of 'analysis_category_cubit.dart';

abstract class AnalysisCategoryState {}

class AnalysisCategoryInitial extends AnalysisCategoryState {}

class AnalysisCategoryLoading extends AnalysisCategoryState {}

class AnalysisCategorySuccess extends AnalysisCategoryState {
  final List<AnalysisCategoryModel> categories;

  AnalysisCategorySuccess(this.categories);
}

class AnalysisCategoryFailure extends AnalysisCategoryState {
  final String message;

  AnalysisCategoryFailure(this.message);
}
