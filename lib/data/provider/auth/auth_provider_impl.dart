import 'package:get/get.dart';
import 'package:ownsaemiro/data/provider/auth/auth_provider.dart';
import 'package:ownsaemiro/data/provider/base/base_connect.dart';

class AuthProviderImpl extends BaseConnect implements AuthProvider {
  @override
  Future<Map<String, dynamic>> loginWithKakaoAccessToken(
      String accessToken) async {
    final Response response;

    try {
      response = await post("/oauth/login/kakao", null,
          headers: {"Authorization": "Bearer $accessToken"});
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
}
