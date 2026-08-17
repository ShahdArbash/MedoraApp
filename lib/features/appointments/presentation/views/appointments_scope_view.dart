import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/appointments/data/services/appointments_service.dart';
import 'package:medoraapp/features/appointments/data/services/cancel_appointment_service.dart';
import 'package:medoraapp/features/appointments/logic/cancel_appointment/cancel_appointment_cubit.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_cubit.dart';
import 'package:medoraapp/features/appointments/presentation/views/appointments_view.dart';

class AppointmentsScopeView extends StatelessWidget {
  const AppointmentsScopeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AppointmentsService()),

        RepositoryProvider(create: (_) => CancelAppointmentService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AppointmentsCubit(context.read<AppointmentsService>())
                  ..getAppointments(),
          ),

          BlocProvider(
            create: (context) => CancelAppointmentCubit(
              context.read<CancelAppointmentService>(),
            ),
          ),
        ],
        child: const AppointmentsView(),
      ),
    );
  }
}
