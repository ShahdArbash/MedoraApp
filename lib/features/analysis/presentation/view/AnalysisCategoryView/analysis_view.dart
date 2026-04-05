import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/constants/fonts.dart';

import '../../../logic/cubit/AnalysisCategoryCubit/analysis_category_cubit.dart';
import '../../widgets/Category/categories_grid.dart';

class AnalysisCategoriesView extends StatefulWidget {
  const AnalysisCategoriesView({super.key});

  @override
  State<AnalysisCategoriesView> createState() => _AnalysisCategoriesViewState();
}

class _AnalysisCategoriesViewState extends State<AnalysisCategoriesView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 👈 هذا مهم جداً

  @override
  void initState() {
    super.initState();
    context.read<AnalysisCategoryCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // 👈 ضروري
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "أسعار التحاليل",
              style: CairoFonts.bold(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        body: BlocBuilder<AnalysisCategoryCubit, AnalysisCategoryState>(
          builder: (context, state) {
            if (state is AnalysisLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is AnalysisLoaded) {
              return AnalysisCategoryGrid(categories: state.categories);
            }

            if (state is AnalysisError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
