abstract class TokenProvider {
  Future<void> onInit();

  Future<void> clearTokens();

  String? get accessToken;

  String? get refreshToken;

  Future<void> setAccessToken(String accessToken);

  Future<void> setRefreshToken(String refreshToken);
}

extension ULPException on TokenProvider {
  static const String accessToken = "access_token";
  static const String refreshToken = "refresh_token";
}
