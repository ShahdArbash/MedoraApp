import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/analysis/data/models/analysis_category_model.dart';
import 'package:medoraapp/features/analysis/presentation/view/AnalysisCardView/analysis_list_view.dart';

import '../../../data/service/analysis_service.dart';
import '../../../logic/cubit/AnalysisCardCubit/analysis_card_cubit.dart';

class AnalysisListScopeView extends StatelessWidget {
  final int categoryId;
  final AnalysisCategoryModel category;

  AnalysisListScopeView({
    super.key,
    required this.categoryId,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AnalysisService(),
      child: BlocProvider(
        create: (context) =>
            AnalysisCubit(context.read<AnalysisService>())
              ..fetchAnalyses(categoryId),
        child: AnalysisListView(category: category),
      ),
    );
  }
}
