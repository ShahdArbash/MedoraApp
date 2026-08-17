import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointment_info_row.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointment_status_badge.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/past/appointment_details_button.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/upcoming/cancel_appointment_button.dart';
import '../../data/models/appointment_model.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;
  final bool isUpcoming;

  final VoidCallback onCancel;
  final VoidCallback onDetails;

  const AppointmentCard({
    super.key,
    required this.appointment,
    required this.isUpcoming,
    required this.onCancel,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 0.3, color: const Color(0x4C3B3B3B)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // السابق فقط
          if (!isUpcoming) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const AppointmentStatusBadge(
                  text: "مكتمل",
                  color: Colors.green,
                ),
              ],
            ),
          ],

          Text(
            appointment.testname,
            style: CairoFonts.bold(color: Colors.black, fontSize: 16),
          ),

          const SizedBox(height: 8),

          AppointmentInfoRow(
            icon: Icons.science,
            text: appointment.labName,
            isPrimary: true,
          ),

          const SizedBox(height: 12),

          AppointmentInfoRow(
            icon: Icons.location_on,
            text: appointment.address,
          ),

          const Divider(height: 24, color: Color.fromARGB(16, 59, 59, 59)),

          AppointmentInfoRow(
            icon: Icons.date_range_outlined,
            text: appointment.date,
          ),

          const Divider(height: 24, color: Color.fromARGB(16, 59, 59, 59)),

          AppointmentInfoRow(
            icon: Icons.timer_outlined,
            text: appointment.time,
          ),

          const Divider(height: 24, color: Color.fromARGB(16, 59, 59, 59)),

          // القادم → إلغاء
          // السابق → التفاصيل
          if (isUpcoming)
            CancelAppointmentButton(onPressed: onCancel)
          else
            AppointmentDetailsButton(onPressed: onDetails),
        ],
      ),
    );
  }
}
