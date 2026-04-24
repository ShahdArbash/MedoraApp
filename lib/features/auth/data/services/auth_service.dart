import 'package:medoraapp/features/auth/data/models/login_request.dart';
import 'package:medoraapp/features/auth/data/models/login_response_model.dart';
import 'package:medoraapp/features/auth/data/models/register_response_model.dart';
import 'package:medoraapp/features/auth/data/models/register_request.dart';
import 'package:medoraapp/features/auth/data/services/api_service.dart';

class AuthService {
  final ApiService apiService;

  AuthService(this.apiService);

  Future<RegisterResponseModel> register(RegisterRequest request) async {
    final response = await apiService.post(
      path: 'register/patient',
      data: request.toJson(),
    );

    return RegisterResponseModel.fromJson(response);
  }
Future<LoginResponseModel> login(LoginRequest request) async {
  final response = await apiService.post(
    path: 'login',
    data: request.toJson(),
  );

  final model = LoginResponseModel.fromJson(response);

  //  حفظ التوكن
  if (model.isSuccess) {
    await TokenStorage.saveTokens(
      accessToken: model.token,
    );
  }

  return model;
}
}
