import 'package:flutter/material.dart';
import 'package:medoraapp/features/analysis/data/models/booking_data.dart';

class AppointmentDetailsView extends StatelessWidget {
  final BookingData bookingData;
  final String selectedDate;
  final String selectedTime;

  const AppointmentDetailsView({
    super.key,
    required this.bookingData,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تأكيد الحجز")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(bookingData.analysisName),
            Text(bookingData.labName),
            Text("التاريخ: $selectedDate"),
            Text("الوقت: $selectedTime"),
            Text("السعر: ${bookingData.price}"),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                // 🔥 هون لاحقاً API
              },
              child: const Text("تأكيد الحجز"),
            ),
          ],
        ),
      ),
    );
  }
}
