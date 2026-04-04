import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';

class ServiceTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const ServiceTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.color = const Color(0x6600AFB4),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: Colors.white.withValues(alpha: 0.3),
        child: Container(
          height: 93,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // دائرة حول الأيقونة
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF008C91), // اللون حول الأيقونة
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: CairoFonts.bold(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
