abstract class UserProvider {
  Future<Map<String, dynamic>> getUsername();

  Future<Map<String, dynamic>> getUserWallet();

  Future<Map<String, dynamic>> chargePoint(int point);

  Future<Map<String, dynamic>> getUserProfile();
}
