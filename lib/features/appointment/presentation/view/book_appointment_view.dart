import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/analysis/data/models/booking_data.dart';
import 'package:medoraapp/features/appointment/logic/cubit/appointment_cubit/appointment_cubit.dart';
import 'package:medoraapp/features/appointment/logic/cubit/appointment_cubit/appointment_state.dart';
import 'package:medoraapp/features/appointment/presentation/widgets/continue_button.dart';
import 'package:medoraapp/features/appointment/presentation/widgets/date_picker_widget.dart';
import 'package:medoraapp/features/appointment/presentation/widgets/progress_stepper.dart';
import 'package:medoraapp/features/appointment/presentation/widgets/time_grid.dart';

class BookAppointmentView extends StatefulWidget {
  final BookingData bookingData;

  const BookAppointmentView({super.key, required this.bookingData});

  @override
  State<BookAppointmentView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {
  String? selectedDate;
  String? selectedTime;

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      final formattedDate = "${picked.year}-${picked.month}-${picked.day}";

      setState(() {
        selectedDate = "${picked.day}/${picked.month}/${picked.year}";
        selectedTime = null;
      });

      /// 🔥 استدعاء الكيوبت (هون الصح)
      context.read<AppointmentCubit>().loadTimes(
        labId: widget.bookingData.labId,
        analysisId: widget.bookingData.analysisId,
        date: formattedDate,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = selectedDate != null && selectedTime != null;

    return Scaffold(
      appBar: AppBar(title: const Text("اختيار الموعد")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const ProgressStepper(currentStep: 3),

            const SizedBox(height: 30),

            /// 🔥 التاريخ
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "اختر التاريخ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            DatePickerField(date: selectedDate, onTap: pickDate),

            const SizedBox(height: 30),

            /// 🔥 الوقت
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "اختر الوقت",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            BlocBuilder<AppointmentCubit, AppointmentState>(
              builder: (context, state) {
                if (state is AppointmentLoading) {
                  return const CircularProgressIndicator();
                }

                if (state is AppointmentLoaded) {
                  return TimeGrid(
                    times: state.times,
                    selectedTime: selectedTime,
                    onSelect: (time) {
                      setState(() => selectedTime = time);
                    },
                  );
                }

                return const Text("اختر تاريخ لعرض الأوقات");
              },
            ),

            const Spacer(),

            ContinueButton(onPressed: isEnabled ? () {} : null),
          ],
        ),
      ),
    );
  }
}
