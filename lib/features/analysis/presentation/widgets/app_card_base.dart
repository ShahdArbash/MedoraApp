import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget top;
  final Widget? bottom;

  const AppCard({super.key, required this.top, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 القسم العلوي
          Padding(padding: const EdgeInsets.all(16), child: top),

          /// 🔹 الخط الفاصل (يظهر فقط إذا في bottom)
          if (bottom != null) const Divider(height: 1),

          /// 🔹 القسم السفلي
          if (bottom != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: bottom!,
            ),
        ],
      ),
    );
  }
}
