abstract class ProfileRemoteDataSource {
  Future<Map<String, dynamic>> getProfileSettings(String userId);
  Future<void> updatePushSetting(String userId, bool isEnabled);
  Future<void> updateProfileName(String userId, String newName);
}
