import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ownsaemiro/data/model/user/user_wallet_state.dart';
import 'package:ownsaemiro/data/repository/user/user_repository.dart';

class PointChargeViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final Rx<UserWalletState> _userWalletState;
  late final RxBool _isPointCharging = false.obs;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  UserWalletState get userWalletState => _userWalletState.value;
  var point = 0.obs;
  final numberFormat = NumberFormat("#,###");

  bool get isPointCharging => _isPointCharging.value;

  NumberFormat get getNumberFormat => numberFormat;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _userRepository = Get.find<UserRepository>();

    // Initialize State
    _userWalletState = UserWalletState(point: 0).obs;
  }

  @override
  void onReady() async {
    super.onReady();

    _isPointCharging.value = true;

    await _userRepository.getUserWallet().then((value) {
      _userWalletState.value = value;
    });

    _isPointCharging.value = false;
  }

  void addDigit(int digit) {
    if (point.value == 0) {
      point.value = digit;
    } else {
      point.value = int.parse("${point.value}$digit");
    }
  }

  void removeDigit() {
    if (point.value > 9) {
      point.value = int.parse(point.value
          .toString()
          .substring(0, point.value.toString().length - 1));
    } else if (point.value > 0 && point.value < 10) {
      point.value = 0;
    }
  }

  void chargePoint() {
    _userRepository.chargePoint(point.value).then((value) {
      _userWalletState.value = value;
    });

    clear();
  }

  void clear() {
    point.value = 0;
  }

  String get formattedPoint => numberFormat.format(point.value);
}
