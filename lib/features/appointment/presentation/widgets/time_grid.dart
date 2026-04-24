import 'package:flutter/material.dart';
import 'package:medoraapp/features/appointment/data/models/time_model.dart';
import 'package:medoraapp/features/appointment/presentation/widgets/time_selector_widget.dart';

class TimeGrid extends StatelessWidget {
  final List<TimeModel> times;
  final String? selectedTime;
  final Function(String) onSelect;

  const TimeGrid({
    super.key,
    required this.times,
    required this.selectedTime,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: times.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) {
        final time = times[index];

        return TimeSlot(
          time: time.time,
          isSelected: selectedTime == time.time,
          isDisabled: !time.isAvailable,
          onTap: () => onSelect(time.time),
        );
      },
    );
  }
}
