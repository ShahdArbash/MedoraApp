import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/appointments/logic/cancel_appointment/cancel_appointment_cubit.dart';
import 'package:medoraapp/features/appointments/logic/cancel_appointment/cancel_appointment_state.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_cubit.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_state.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointment_card.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointment_skeleton.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/empty_widget.dart';

class AppointmentsList extends StatelessWidget {
  final AppointmentFilter type;

  const AppointmentsList({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CancelAppointmentCubit, CancelAppointmentState>(
      listener: (context, cancelState) {
        if (cancelState is CancelAppointmentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("تم إلغاء الموعد بنجاح")),
          );

          context.read<AppointmentsCubit>().getAppointments();
        }

        if (cancelState is CancelAppointmentError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(cancelState.message)));
        }
      },
      child: BlocBuilder<AppointmentsCubit, AppointmentsState>(
        builder: (context, state) {
          if (state is AppointmentsLoading) {
            return const AppointmentSkeleton();
          }

          if (state is AppointmentsError) {
            return Center(child: Text(state.message));
          }

          if (state is AppointmentsLoaded) {
            final appointments = type == AppointmentFilter.upcoming
                ? state.upcoming
                : state.past;

            if (appointments.isEmpty) {
              return const EmptyWidget();
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: appointments.length,
              itemBuilder: (_, i) {
                final appointment = appointments[i];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: AppointmentCard(
                    appointment: appointment,

                    isUpcoming: type == AppointmentFilter.upcoming,

                    onCancel: () {
                      context.read<CancelAppointmentCubit>().cancelAppointment(
                        appointment.id,
                      );
                    },

                    onDetails: () {
                      // عرض التفاصيل
                    },
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
