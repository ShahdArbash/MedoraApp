import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisCardCubit/analysis_card_cubit.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisCardCubit/analysis_card_state.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisCategoryCubit/analysis_category_cubit.dart';
import 'package:medoraapp/features/analysis/presentation/view/AnalysisLabsView/analysis_labs_scope_view.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisCard/analysis_card.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisCard/analysis_list_skeleton.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisCard/search_field.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisLabCard/analysis_categories_filter.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_custom_app_bar.dart';
import 'package:medoraapp/features/booking/logic/select_analysis/select_analysis_cubit.dart';

class AnalysisListView extends StatelessWidget {
  const AnalysisListView({super.key});

  @override
  Widget build(BuildContext context) {
    final analysisCubit = context.read<AnalysisCubit>();
    return SafeArea(
      child: Scaffold(
        appBar: const AppCustomAppBar(title: "أسعار التحاليل"),
        body: Column(
          children: [
            const Divider(),

            Padding(
              padding: const EdgeInsets.all(16),
              child: AppSearchField(
                hint: "ابحث عن تحليل...",
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<AnalysisCategoryCubit, AnalysisCategoryState>(
                builder: (context, categoryState) {
                  if (categoryState is AnalysisCategoryLoading) {
                    return const SizedBox(height: 40);
                  }

                  if (categoryState is AnalysisCategoryFailure) {
                    return Text(categoryState.message);
                  }

                  if (categoryState is AnalysisCategorySuccess) {
                    return BlocBuilder<
                      SelectAnalysisCubit,
                      SelectAnalysisState
                    >(
                      builder: (context, selectState) {
                        return AnalysisCategoriesFilter(
                          categories: categoryState.categories,

                          selectedCategoryId: selectState.selectedCategoryId,

                          onCategorySelected: (categoryId) {
                            context.read<SelectAnalysisCubit>().selectCategory(
                              categoryId,
                            );

                            if (categoryId == null) {
                              analysisCubit.fetchAllAnalyses();
                            } else {
                              analysisCubit.fetchAnalyses(categoryId);
                            }
                          },
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: BlocBuilder<AnalysisCubit, AnalysisState>(
                builder: (context, state) {
                  if (state is AnalysisLoading) {
                    return const AnalysisListSkeleton();
                  }

                  if (state is AnalysisError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is AnalysisEmpty) {
                    return const Center(child: Text("لا يوجد تحاليل"));
                  }

                  if (state is AnalysisSuccess) {
                    return ListView.builder(
                      itemCount: state.analyses.length,
                      itemBuilder: (context, index) {
                        final item = state.analyses[index];

                        return AnalysisCard(
                          analysis: item,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    AnalysisLabsScopeView(analysis: item),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
