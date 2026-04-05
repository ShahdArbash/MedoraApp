import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/analysis/data/models/analysis_category_model.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisCardCubit/analysis_card_cubit.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisCardCubit/analysis_card_state.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/analysis_card.dart';

class AnalysisListView extends StatelessWidget {
  final AnalysisCategoryModel category;

  const AnalysisListView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title, style: CairoFonts.bold(fontSize: 14)),
      ),
      body: BlocBuilder<AnalysisCubit, AnalysisState>(
        builder: (context, state) {
          if (state is AnalysisLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AnalysisError) {
            return Center(child: Text(state.message));
          }

          if (state is AnalysisSuccess) {
            return ListView.builder(
              itemCount: state.analyses.length,
              itemBuilder: (context, index) {
                final item = state.analyses[index];

                return AnalysisCard(
                  title: item.name,
                  subtitle: item.description,
                  onTap: () {
                    // لاحقاً: عرض المخابر
                  },
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
