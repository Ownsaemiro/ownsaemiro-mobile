import 'package:get/get.dart';
import 'package:ownsaemiro/data/provider/base/base_connect.dart';
import 'package:ownsaemiro/data/provider/user/user_provider.dart';

class UserProviderImpl extends BaseConnect implements UserProvider {
  @override
  Future<Map<String, dynamic>> getUsername() async {
    final Response response;

    try {
      response = await get(
        "/api/users/nickname",
      );
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }

  @override
  Future<Map<String, dynamic>> getUserWallet() async {
    final Response response;

    try {
      response = await get("/api/users/wallets");
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }

  @override
  Future<Map<String, dynamic>> chargePoint(int point) async {
    final Response response;

    try {
      response = await put("/api/users/wallets", {"point": point});
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }

  @override
  Future<Map<String, dynamic>> getUserProfile() async {
    final Response response;

    try {
      response = await get("/api/users/profile-image");
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }
}
