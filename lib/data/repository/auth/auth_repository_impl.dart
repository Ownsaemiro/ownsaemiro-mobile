import 'package:get/get.dart';
import 'package:ownsaemiro/app/factory/secure_storage_factory.dart';
import 'package:ownsaemiro/data/provider/auth/auth_provider.dart';
import 'package:ownsaemiro/data/provider/token/token_provider.dart';
import 'package:ownsaemiro/data/repository/auth/auth_repository.dart';

class AuthRepositoryImpl extends GetxService implements AuthRepository {
  late final AuthProvider _authProvider;
  late final TokenProvider _tokenProvider;

  @override
  void onInit() {
    super.onInit();

    _authProvider = Get.find<AuthProvider>();
    _tokenProvider = SecureStorageFactory.tokenProvider;
  }

  @override
  Future<bool> register(String username, String nickname, String phoneNumber,
      String deviceId, String serialId) async {
    Map<String, dynamic> data;

    try {
      data = await _authProvider.register(
          username, nickname, phoneNumber, deviceId, serialId);
    } catch (e) {
      return false;
    }

    if (data.containsKey("access_token") && data["access_token"] != null) {
      await _tokenProvider.setAccessToken(data["access_token"]);
    } else {
      return false;
    }

    if (data.containsKey("refresh_token") && data["refresh_token"] != null) {
      await _tokenProvider.setRefreshToken(data["refresh_token"]);
    } else {
      return false;
    }

    return true;
  }

  @override
  Future<bool> login(String serialId) async {
    Map<String, dynamic> data;

    try {
      data = await _authProvider.login(serialId);
    } catch (e) {
      return false;
    }

    if (data.containsKey("access_token") && data["access_token"] != null) {
      await _tokenProvider.setAccessToken(data["access_token"]);
    } else {
      return false;
    }

    if (data.containsKey("refresh_token") && data["refresh_token"] != null) {
      await _tokenProvider.setRefreshToken(data["refresh_token"]);
    } else {
      return false;
    }

    return true;
  }
}
