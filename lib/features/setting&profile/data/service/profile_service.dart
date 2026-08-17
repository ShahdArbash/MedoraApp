import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/setting&profile/data/model/update_profile_request.dart';
import 'package:medoraapp/features/setting&profile/data/model/user_profile_model.dart';
import 'package:medoraapp/features/setting&profile/data/service/profile_local_service.dart';

class ProfileService {
  final ApiClient apiClient;
  final ProfileLocalService localService;

  ProfileService(this.apiClient, this.localService);

  Future<UserProfileModel> getProfile() async {
    final localProfile = await localService.getProfile();

    if (localProfile != null) {
      return localProfile;
    }

    final response = await apiClient.client.get("/patient/profile");

    final profile = UserProfileModel.fromJson(response.data["data"]);

    await localService.saveProfile(profile);

    return profile;
  }

  Future<UserProfileModel> updateProfile(UpdateProfileRequest request) async {
    final response = await apiClient.client.post(
      "/patient/profile/update",
      data: request.toJson(),
    );

    final updatedProfile = UserProfileModel.fromJson(response.data["data"]);

    // تحديث البيانات الموجودة بالـ Local
    await localService.saveProfile(updatedProfile);

    return updatedProfile;
  }

  Future<void> clearLocalProfile() async {
    await localService.clearProfile();
  }
}
