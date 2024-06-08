import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/profile/purchased_history_state.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository.dart';

class PurchaseHistoryViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ProfileRepository _profileRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<PurchasedHistoryState> _purchasedHistoryList;
  final RxBool _isLoading = false.obs;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<PurchasedHistoryState> get purchasedHistoryList => _purchasedHistoryList;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _profileRepository = Get.find<ProfileRepository>();

    // Initialize State
    _purchasedHistoryList = <PurchasedHistoryState>[].obs;
  }

  @override
  void onReady() async {
    super.onReady();

    _isLoading.value = true;

    await _profileRepository.getPurchasedList(page: 1, size: 8).then((value) {
      _purchasedHistoryList.addAll(value);
    });

    _isLoading.value = false;
  }
}
