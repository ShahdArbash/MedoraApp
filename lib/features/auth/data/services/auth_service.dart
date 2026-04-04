import 'package:medoraapp/features/auth/data/models/login_response_model.dart';
import 'package:medoraapp/features/auth/data/models/register_response_model.dart';
import 'package:medoraapp/features/auth/data/services/api_service.dart';

class AuthService {
  final ApiService apiService;

  AuthService(this.apiService);

  Future<RegisterResponseModel> registerPatient({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await apiService.post(
      path: 'register/patient',
      data: {"name": name, "email": email, "password": password},
    );

    return RegisterResponseModel.fromJson(response);
  }

  Future<LoginResponseModel> loginPatient({
    required String email,
    required String password,
  }) async {
    final response = await apiService.post(
      path: 'login',
      data: {'email': email, 'password': password},
    );

    return LoginResponseModel.fromJson(response);
  }
}
