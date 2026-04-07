import 'package:flutter/material.dart';

class AnalysisCategoryModel {
  final String title;
  final int id;
  final int testsCount;
  final String iconName;

  const AnalysisCategoryModel({
    required this.title,
    required this.id,
    required this.testsCount,
    required this.iconName,
  });

  factory AnalysisCategoryModel.fromJson(Map<String, dynamic> json) {
    return AnalysisCategoryModel(
      title: json['name'] ?? '',
      id: json['id'] ?? 0,
      testsCount: json['tests_count'] ?? 0,
      iconName: json['icon'] ?? 'science', // 👈 fallback
    );
  }

  // 🔥 تحويل الاسم إلى IconData
  IconData get iconData => _mapIcon(iconName);

  static IconData _mapIcon(String name) {
    switch (name) {
      case 'bloodtype':
        return Icons.bloodtype;
      case 'science':
        return Icons.science;
      case 'biotech':
        return Icons.biotech;
      case 'coronavirus':
        return Icons.coronavirus;
      case 'water_drop':
        return Icons.water_drop;
      case 'medical_services':
        return Icons.medical_services;
      case 'shield':
        return Icons.shield;
      case 'diamond':
        return Icons.diamond;
      case 'favorite':
        return Icons.favorite;
      case 'child_care':
        return Icons.child_care;
      case 'healing':
        return Icons.healing;
      default:
        return Icons.science; // 👈 fallback
    }
  }
}
