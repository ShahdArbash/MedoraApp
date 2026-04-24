import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/analysis/data/models/booking_data.dart';
import 'package:medoraapp/features/appointment/data/repository/appointment_repository.dart';
import 'package:medoraapp/features/appointment/data/service/appointment_service.dart';
import 'package:medoraapp/features/appointment/logic/cubit/appointment_cubit/appointment_cubit.dart';
import 'package:medoraapp/features/appointment/presentation/view/book_appointment_view.dart';

class AppointmentScopeView extends StatelessWidget {
  final BookingData bookingData;

  const AppointmentScopeView({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AppointmentService(),
      child: BlocProvider(
        create: (context) => AppointmentCubit(
          AppointmentRepository(context.read<AppointmentService>()),
        ),
        child: BookAppointmentView(bookingData: bookingData),
      ),
    );
  }
}
