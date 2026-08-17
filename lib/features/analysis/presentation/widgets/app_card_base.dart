import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget top;
  final Widget? bottom;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  final bool isSelected;
  final Widget? selectionWidget;

  const AppCard({
    super.key,
    required this.top,
    this.bottom,
    this.onTap,
    this.onLongPress,
    this.isSelected = false,
    this.selectionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Stack(
        children: [
          Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.withValues(alpha: 0.2),
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.all(16), child: top),

                if (bottom != null) const Divider(height: 1),

                if (bottom != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: bottom!,
                  ),
              ],
            ),
          ),

          if (isSelected)
            Positioned(
              top: 18,
              left: 24,
              child:
                  selectionWidget ??
                  const CircleAvatar(
                    radius: 12,
                    child: Icon(Icons.check, size: 16),
                  ),
            ),
        ],
      ),
    );
  }
}
