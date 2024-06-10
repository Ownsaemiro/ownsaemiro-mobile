import 'package:get/get.dart';
import 'package:ownsaemiro/data/provider/auth/auth_provider.dart';
import 'package:ownsaemiro/data/provider/base/base_connect.dart';

class AuthProviderImpl extends BaseConnect implements AuthProvider {
  @override
  Future<Map<String, dynamic>> loginWithKakaoAccessToken(
      String accessToken) async {
    final Response response;

    try {
      response = await get("/api/oauth/login/kakao?access_token=$accessToken");
    } catch (e) {
      rethrow;
    }
    return response.body["data"];
  }

  @override
  Future<Map<String, dynamic>> loginWithNaverAccessToken(
      String accessToken) async {
    final Response response;

    try {
      response = await post("/oauth/login/naver", null,
          headers: {"Authorization": "Bearer $accessToken"});
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }

  @override
  Future<Map<String, dynamic>> register(String username, String nickname,
      String phoneNumber, String deviceId, String serialId) async {
    final Response response;

    try {
      response = await post("/api/oauth/sign-up", {
        "serial_id": serialId,
        "device_id": deviceId,
        "name": username,
        "nickname": nickname,
        "phone_number": phoneNumber,
        "provider": "KAKAO"
      });
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }

  @override
  Future<Map<String, dynamic>> login(String serialId) async {
    final Response response;

    try {
      response = await post("/api/oauth/sign-up", {
        "serial_id": serialId,
      });
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }

  @override
  Future<void> updateFcmToken(String fcmToken) async {
    try {
      await put("/api/users/fcm-token", {
        "fcm_token": fcmToken,
      });
    } catch (e) {
      rethrow;
    }
  }
}
