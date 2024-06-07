import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/utility/device_util.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/data/provider/auth/auth_provider.dart';
import 'package:ownsaemiro/data/repository/auth/auth_repository.dart';

class EntryViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final AuthProvider _authProvider;
  late final AuthRepository _authRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxString _serialId = "".obs;
  late final RxString _deviceId = "".obs;
  late final TextEditingController _usernameController;
  late final TextEditingController _nicknameController;
  late final TextEditingController _phoneNumberController;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  TextEditingController get usernameController => _usernameController;

  TextEditingController get nicknameController => _nicknameController;

  TextEditingController get phoneNumberController => _phoneNumberController;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _authProvider = Get.find<AuthProvider>();
    _authRepository = Get.find<AuthRepository>();

    // Initialize Controller
    _usernameController = TextEditingController();
    _nicknameController = TextEditingController();
    _phoneNumberController = TextEditingController();

    setDeviceId();
  }

  void setDeviceId() {
    DeviceUtil.getMobileId().then((value) {
      _deviceId.value = value;
    });
  }

  void register() async {
    String username = _usernameController.text;
    String nickname = _nicknameController.text;
    String phoneNumber = _phoneNumberController.text;
    String deviceId = _deviceId.value;
    String serialId = _serialId.value;

    if (username.isEmpty || nickname.isEmpty || phoneNumber.isEmpty) {
      Get.snackbar("알림", "모든 항목을 입력해주세요.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          colorText: Colors.black);
      return;
    }

    bool t = await _authRepository.register(
        username, nickname, phoneNumber, deviceId, serialId);

    if (t) {
      Get.toNamed(Routes.ROOT);
    }
  }

  Future<void> kakaoSignInAccount() async {
    String kakaoAccessToken;

    try {
      OAuthToken token;

      if (await isKakaoTalkInstalled()) {
        token = await UserApi.instance.loginWithKakaoTalk();
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
      }

      kakaoAccessToken = token.accessToken;
    } catch (_) {
      LogUtil.error("Kakao Login Error");
      return;
    }

    Map<String, dynamic> result =
        await _authProvider.loginWithKakaoAccessToken(kakaoAccessToken);

    if (result["serial_id"] != null && result["is_existed"] == true) {
      _serialId.value = result["serial_id"];
      bool t = await _authRepository.login(_serialId.value);
      if (t) {
        Get.toNamed(Routes.ROOT);
      }
    } else if (result["serial_id"] != null && result["is_existed"] == false) {
      _serialId.value = result["serial_id"];
      Get.toNamed(Routes.REGISTER);
    } else {
      LogUtil.error("Kakao Login Error");
    }
  }
}
