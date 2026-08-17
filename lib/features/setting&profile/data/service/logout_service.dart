import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/setting&profile/data/service/profile_local_service.dart';

class LogoutService {
  final ApiClient apiClient;
  final ProfileLocalService localService;

  LogoutService(this.apiClient, this.localService);

  Future<void> logout() async {
    try {
      await apiClient.client.post('/logout');
    } finally {
      // سواء نجح طلب الـ API أو صار خطأ،
      // نمسح البيانات المحلية حتى لا يبقى المستخدم مسجلاً محلياً.
      await localService.clearProfile();
    }
  }
}
