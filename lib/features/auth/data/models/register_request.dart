class RegisterRequest {
  final String name;
  final String email;
  final String password;

  const RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "name": name.trim(),
    "email": email.trim(),
    "password": password,
  };

  factory RegisterRequest.fromForm({
    required String name,
    required String email,
    required String password,
  }) {
    return RegisterRequest(name: name, email: email, password: password);
  }
}
