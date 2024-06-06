import 'package:get/get.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/data/model/user/user_image_state.dart';
import 'package:ownsaemiro/data/model/user/user_name_state.dart';
import 'package:ownsaemiro/data/model/user/user_wallet_state.dart';
import 'package:ownsaemiro/data/provider/user/user_provider.dart';
import 'package:ownsaemiro/data/repository/user/user_repository.dart';

class UserRepositoryImpl extends GetxService implements UserRepository {
  late final UserProvider _userProvider;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _userProvider = Get.find<UserProvider>();
  }

  @override
  Future<UserNameState> getUsername() async {
    Map<String, dynamic> result;

    try {
      result = await _userProvider.getUsername();
    } catch (e) {
      rethrow;
    }

    return UserNameState.fromJson(result);
  }

  @override
  Future<UserWalletState> getUserWallet() async {
    Map<String, dynamic> result;

    try {
      result = await _userProvider.getUserWallet();
    } catch (e) {
      rethrow;
    }

    return UserWalletState.fromJson(result);
  }

  @override
  Future<UserWalletState> chargePoint(int point) async {
    Map<String, dynamic> result;

    try {
      result = await _userProvider.chargePoint(point);
    } catch (e) {
      rethrow;
    }

    return UserWalletState.fromJson(result);
  }

  @override
  Future<UserImageState> getUserProfile() async {
    Map<String, dynamic> result;

    try {
      result = await _userProvider.getUserProfile();
    } catch (e) {
      rethrow;
    }

    return UserImageState.fromJson(result);
  }
}
