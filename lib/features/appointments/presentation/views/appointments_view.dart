import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_cubit.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_state.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointment_list.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/tab_section.dart';

class AppointmentsView extends StatefulWidget {
  const AppointmentsView({super.key});

  @override
  State<AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<AppointmentsView> {
  late final PageController _pageController;

  AppointmentFilter _selectedFilter = AppointmentFilter.upcoming;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    context.read<AppointmentsCubit>().getAppointments();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changeTab(AppointmentFilter filter) {
    final index = filter == AppointmentFilter.upcoming ? 0 : 1;

    setState(() {
      _selectedFilter = filter;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("سجل المواعيد"), centerTitle: true),
        body: Column(
          children: [
            TabsSection(selected: _selectedFilter, onChanged: _changeTab),

            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedFilter = index == 0
                        ? AppointmentFilter.upcoming
                        : AppointmentFilter.previous;
                  });
                },
                children: const [
                  AppointmentsList(type: AppointmentFilter.upcoming),
                  AppointmentsList(type: AppointmentFilter.previous),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
