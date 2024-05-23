abstract class AuthProvider {
  Future<Map<String, dynamic>> loginWithKakaoAccessToken(String accessToken);

  Future<Map<String, dynamic>> loginWithNaverAccessToken(String accessToken);
}
