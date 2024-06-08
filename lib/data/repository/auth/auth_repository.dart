abstract class AuthRepository {
  Future<bool> register(String username, String nickname, String phoneNumber,
      String deviceId, String serialId);

  Future<bool> login(String serialId);
}
