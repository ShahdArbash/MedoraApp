import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/analysis/data/service/analysis_labs_service.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisLabsCubit/analysis_labs_cubit.dart';
import 'package:medoraapp/features/analysis/presentation/view/AnalysisLabsView/analysis_labs_view.dart';

class AnalysisLabsScopeView extends StatelessWidget {
  final int analysisId;
  final String analysisName;

  const AnalysisLabsScopeView({
    super.key,
    required this.analysisId,
    required this.analysisName,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AnalysisLabsService(),
      child: BlocProvider(
        create: (context) =>
            AnalysisLabsCubit(context.read<AnalysisLabsService>())
              ..getLabs(analysisId),
        child: AnalysisLabsView(title: analysisName),
      ),
    );
  }
}
