import 'package:flutter/material.dart';
import 'package:medoraapp/constants/static_data.dart';

class MedicalBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MedicalBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  Widget _buildIcon(BuildContext context, IconData icon, bool isActive) {
    final theme = Theme.of(context);
    // توحيد عرض العنصر
    return SizedBox(
      width: 40,
      height: 40,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: isActive
              ? BoxDecoration(
                  color: theme.primaryColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                )
              : null,
          child: Icon(
            icon,
            color: isActive ? theme.primaryColor : Colors.grey,
            size: 28,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = getListNavBar(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        items: List.generate(items.length, (index) {
          final item = items[index];
          return BottomNavigationBarItem(
            icon: _buildIcon(context, (item.icon as Icon).icon!, false),
            activeIcon: _buildIcon(
              context,
              (item.activeIcon as Icon).icon!,
              true,
            ),
            label: item.label,
          );
        }),
      ),
    );
  }
}
