import 'package:get/get.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
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
  Future<Map<String, dynamic>> getUsername() async {
    Map<String, dynamic> result;

    try {
      result = await _userProvider.getUsername();
    } catch (e) {
      rethrow;
    }

    return {"username": result["nickname"]};
  }
}
