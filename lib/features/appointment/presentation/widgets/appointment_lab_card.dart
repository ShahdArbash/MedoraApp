import 'package:flutter/material.dart';
import 'package:medoraapp/features/analysis/data/models/analysis_lab_model.dart';
import 'select_button.dart';

class AppointmentLabCard extends StatelessWidget {
  final AnalysisLabModel lab;
  final bool isSelected;
  final VoidCallback onSelect;

  const AppointmentLabCard({
    super.key,
    required this.lab,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isSelected ? const Color(0xFF00AFB4) : Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          /// 🔥 صورة
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              "https://placehold.co/78x72",
              width: 78,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          /// 🔥 المعلومات
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lab.labName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "${lab.price} دولار",
                  style: const TextStyle(
                    color: Color(0xFF00AFB4),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "مدة التسليم: ${lab.duration}",
                  style: const TextStyle(color: Colors.black54),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    Text("${lab.rating}"),
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                  ],
                ),
              ],
            ),
          ),

          /// 🔥 زر الاختيار
          SelectButton(isSelected: isSelected, onTap: onSelect),
        ],
      ),
    );
  }
}
