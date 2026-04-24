import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/analysis/data/models/booking_data.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisLabsCubit/analysis_labs_cubit.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisLabsCubit/analysis_labs_state.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisCard/count_badge.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisLabCard/analysis_lab_card.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_base_screen.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_sort_dropdown.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/AnalysisLabCard/skeleton_list.dart';
import 'package:medoraapp/features/appointment/presentation/view/appointment_scope_view.dart';

class AnalysisLabsView extends StatefulWidget {
  final String title;

  const AnalysisLabsView({super.key, required this.title});

  @override
  State<AnalysisLabsView> createState() => _AnalysisLabsViewState();
}

class _AnalysisLabsViewState extends State<AnalysisLabsView> {
  String sortValue = "price";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisLabsCubit, AnalysisLabsState>(
      builder: (context, state) {
        return AppBaseScreen(
          title: widget.title,

          /// 🔥 عداد المخابر
          trailing: state is AnalysisLabsLoaded
              ? CountBadge(count: state.filteredCount, label: "مخبر")
              : null,

          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Text("ترتيب حسب:", style: CairoFonts.bold()),
                    const SizedBox(width: 8),
                    AppSortDropdown(
                      value: sortValue,
                      onChanged: (v) {
                        setState(() => sortValue = v);

                        // 🔥 جاهز للربط لاحقاً
                        // context.read<AnalysisLabsCubit>().sort(v);
                      },
                    ),
                  ],
                ),
              ),

              Expanded(child: _buildBody(state)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(AnalysisLabsState state) {
    if (state is AnalysisLabsLoading) {
      return const AnalysisLabsSkeletonList();
    }

    if (state is AnalysisLabsError) {
      return Center(child: Text(state.message));
    }

    if (state is AnalysisLabsEmpty) {
      return const Center(child: Text("لا يوجد مخابر"));
    }

    if (state is AnalysisLabsLoaded) {
      return ListView.builder(
        itemCount: state.labs.length,
        itemBuilder: (context, index) {
          return AnalysisLabCard(
            lab: state.labs[index],
            analysisName: widget.title,
            onBook: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AppointmentScopeView(
                    bookingData: BookingData(
                      labId: state.labs[index].labId, // ✅ صح
                      analysisId: state.labs[index].analysisId, // ✅ صح
                      analysisName: widget.title,
                      labName: state.labs[index].labName,
                      price: state.labs[index].price,
                      location: state.labs[index].location,
                      duration: state.labs[index].duration,
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    }

    return const SizedBox();
  }
}
