import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/profile/user_liked_event_state.dart';
import 'package:ownsaemiro/data/provider/profile/profile_provider.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository.dart';

class ProfileRepositoryImpl extends GetxService implements ProfileRepository {
  late final ProfileProvider _profileProvider;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _profileProvider = Get.find<ProfileProvider>();
  }

  @override
  Future<List<UserLikedEventState>> getUserLikedEvent(
      {required int page, required int size}) async {
    Map<String, dynamic> result;

    try {
      result = await _profileProvider.getUserLikedEvent(page: page, size: size);
    } catch (e) {
      rethrow;
    }

    return result["events"]
        .map<UserLikedEventState>(
            (event) => UserLikedEventState.fromJson(event))
        .toList();
  }
}
