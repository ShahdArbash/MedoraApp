import 'user_model.dart';

class LoginResponseModel {
  final String status;
  final String message;
  final UserModel user;
  final String token;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return LoginResponseModel(
      status: json['status'],
      message: json['message'],
      user: UserModel.fromJson(data['user']),
      token: data['authorisation']['token'],
    );
  }

  bool get isSuccess => status == 'success';
}
