import 'package:medoraapp/constants/assets.dart';

class UserProfileModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String? avatarUrl;
  final String birthDate;
  final String medicalNotes;

  const UserProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.avatarUrl,
    required this.birthDate,
    required this.medicalNotes,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      avatarUrl: json['avatar_url'] != null
          ? json['avatar_url'] as String
          : Assets.profile,
      birthDate: json['birth_date'] ?? '',
      medicalNotes: json['medical_notes'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'avatar_url': avatarUrl,
      'birth_date': birthDate,
      'medical_notes': medicalNotes,
    };
  }
}
