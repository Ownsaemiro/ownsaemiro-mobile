abstract class AuthProvider {
  Future<Map<String, dynamic>> loginWithKakaoAccessToken(String accessToken);

  Future<Map<String, dynamic>> loginWithNaverAccessToken(String accessToken);

  Future<Map<String, dynamic>> register(String username, String nickname,
      String phoneNumber, String deviceId, String serialId);

  Future<Map<String, dynamic>> login(String serialId);
}
