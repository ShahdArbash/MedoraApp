import 'dart:convert';

import 'package:medoraapp/features/setting&profile/data/model/user_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileLocalService {
  static const String _profileKey = 'user_profile';

  Future<void> saveProfile(UserProfileModel profile) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = jsonEncode(profile.toJson());

    await prefs.setString(_profileKey, jsonString);
  }

  Future<UserProfileModel?> getProfile() async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString(_profileKey);

    if (jsonString == null) {
      return null;
    }

    final Map<String, dynamic> json = jsonDecode(jsonString);

    return UserProfileModel.fromJson(json);
  }

  Future<void> clearProfile() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_profileKey);
  }
}
