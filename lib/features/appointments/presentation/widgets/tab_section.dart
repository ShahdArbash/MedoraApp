import 'package:flutter/material.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_state.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointments_tabs.dart';

class TabsSection extends StatelessWidget {
  final AppointmentFilter selected;
  final ValueChanged<AppointmentFilter> onChanged;

  const TabsSection({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: SizedBox(
        height: 56,
        child: AppointmentsTabs(selected: selected, onChanged: onChanged),
      ),
    );
  }
}
