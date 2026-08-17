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
import 'package:medoraapp/features/booking/presentation/widgets/booking_progress_bar.dart';

class SelectAnalysisView extends StatelessWidget {
  const SelectAnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    final analysisCubit = context.read<AnalysisCubit>();

    return SafeArea(
      child: Scaffold(
        appBar: const AppCustomAppBar(title: "حجز موعد"),

        body: Column(
          children: [
            // ================= HEADER =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const BookingProgressBar(currentStep: 1, totalSteps: 4),
                  const SizedBox(height: 12),

                  AppSearchField(
                    hint: "ابحث عن تحليل...",
                    onChanged: (value) {
                      // لاحقاً search
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ================= CATEGORIES =================
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
                            // 1️⃣ خزّن الحالة
                            context.read<SelectAnalysisCubit>().selectCategory(
                              categoryId,
                            );

                            // 2️⃣ حمّل البيانات
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

            const SizedBox(height: 10),

            // ================= LIST =================
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
                    final selectCubit = context.watch<SelectAnalysisCubit>();

                    return ListView.separated(
                      padding: const EdgeInsets.all(12),
                      itemCount: state.analyses.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),

                      itemBuilder: (context, index) {
                        final item = state.analyses[index];

                        return AnalysisCard(
                          analysis: item,

                          isSelected: selectCubit.isSelected(item.id),

                          onTap: () {
                            if (selectCubit.state.selectionMode) {
                              selectCubit.toggleSelection(item.id);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      AnalysisLabsScopeView(analysis: item),
                                ),
                              );
                            }
                          },

                          onLongPress: () {
                            selectCubit.startSelection(item.id);
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
