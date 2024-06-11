import 'package:get/get.dart';
import 'package:ownsaemiro/app/utility/device_util.dart';
import 'package:ownsaemiro/data/model/profile/purchased_history_detail_state.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository.dart';
import 'package:ownsaemiro/presentation/view_model/profile/purchase_history_view_model.dart';

class PurchaseHistoryDetailViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ProfileRepository _profileRepository;
  late final PurchaseHistoryViewModel _controller;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final Rx<PurchasedHistoryDetailState> _purchasedHistoryDetailState;
  final RxBool _isLoading = false.obs;
  final RxString _deviceId = "".obs;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  PurchasedHistoryDetailState get purchasedHistoryDetailState =>
      _purchasedHistoryDetailState.value;

  bool get isLoading => _isLoading.value;

  String get deviceId => _deviceId.value;

  PurchaseHistoryViewModel get controller => _controller;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _profileRepository = Get.find<ProfileRepository>();
    _controller = Get.find<PurchaseHistoryViewModel>();

    // Initialize State
    _purchasedHistoryDetailState = PurchasedHistoryDetailState(
      id: 0,
      image: "",
      title: "",
      category: "",
      durationTime: "",
      duration: "",
      rating: "",
      address: "",
      cellPhoneNumber: "",
      transactionId: "",
      userId: 0,
      activatedAt: "",
      ticketHash: "",
    ).obs;
  }

  void setPurchasedHistoryDetailState(int id) async {
    _isLoading.value = true;
    _purchasedHistoryDetailState.value =
        await _profileRepository.getPurchasedDetail(id: id);

    _deviceId.value = await DeviceUtil.getMobileId();

    _isLoading.value = false;
  }

  void cancelTicket() async {
    await _profileRepository.cancelTicket(
      id: purchasedHistoryDetailState.id,
    );
  }
}
