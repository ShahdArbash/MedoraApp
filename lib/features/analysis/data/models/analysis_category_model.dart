import 'package:flutter/material.dart';

class AnalysisCategoryModel {
  final String title;
  final int id;
  final int testsCount;
  final int iconCode;
  final String iconFamily;

  const AnalysisCategoryModel({
    required this.title,
    required this.id,
    required this.testsCount,
    required this.iconCode,
    required this.iconFamily,
  });

  factory AnalysisCategoryModel.fromJson(Map<String, dynamic> json) {
    return AnalysisCategoryModel(
      title: json['name'] ?? '',
      id: json['id'] ?? 0,
      testsCount: json['tests_count'] ?? 0,
      iconCode: _parseIconCode(json['icon_code']),
      iconFamily: json['icon_family'] ?? 'MaterialIcons',
    );
  }

  // 🔥 fallback ثابت
  static const int _defaultIconCode = 0xe3af;

  // 🔥 parsing آمن ويدعم hex
  static int _parseIconCode(dynamic value) {
    if (value is int) return value;

    if (value is String) {
      try {
        return int.parse(value);
      } catch (_) {
        return _defaultIconCode;
      }
    }

    return _defaultIconCode;
  }

  // 🔥 IconData جاهزة
  IconData get iconData => IconData(iconCode, fontFamily: iconFamily);

  // 🔥 مفيد للـ debugging
  @override
  String toString() {
    return 'AnalysisCategory(id: $id, title: $title)';
  }
}
