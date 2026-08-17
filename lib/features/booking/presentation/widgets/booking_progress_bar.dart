import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';

class BookingProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const BookingProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    final progress = currentStep / totalSteps;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "$currentStep/$totalSteps",

          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),

        const SizedBox(height: 8),

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: AppColors.primaryColor.withValues(alpha: 0.1),
            valueColor: const AlwaysStoppedAnimation(AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
