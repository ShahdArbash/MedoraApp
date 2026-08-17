class UpdateProfileRequest {
  final String name;
  final String email;
  final String phone;
  final String birthDate;
  final String gender;

  const UpdateProfileRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'birth_date': birthDate,
      'gender': gender,
    };
  }
}
