import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/analysis/presentation/view/analysis_view.dart';

import '../../logic/cubit/AnalysisData/analysis_cubit.dart';
import '../../data/service/analysis_service.dart';
import '../../logic/cubit/analysis_selection_cubit.dart';

class AnalysisScopeView extends StatelessWidget {
  const AnalysisScopeView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AnalysisService(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AnalysisCubit(service: context.read<AnalysisService>()),
          ),
          BlocProvider(create: (_) => AnalysisSelectionCubit()),
        ],
        child: const AnalysisCategoriesView(),
      ),
    );
  }
}
