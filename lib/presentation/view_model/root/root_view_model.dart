import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/name/user_name_state.dart';
import 'package:ownsaemiro/data/repository/user/user_repository.dart';

class RootViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxInt _selectedIndex;
  late final RxBool _isExpanded;
  late final Rx<UserNameState> _userNameState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  int get selectedIndex => _selectedIndex.value;

  bool get isExpanded => _isExpanded.value;

  String get name => _userNameState.value.name;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _userRepository = Get.find<UserRepository>();

    // Initialize State
    _selectedIndex = 0.obs;
    _isExpanded = false.obs;
    _userNameState = Rx<UserNameState>(UserNameState(name: ""));
  }

  @override
  void onReady() async {
    super.onReady();
    await _userRepository.getUsername().then((value) {
      _userNameState.value = UserNameState(name: value["username"]);
    });
  }

  void changeIndex(int index) {
    _selectedIndex.value = index;
  }

  void onClickFloatingActionButton() {
    _isExpanded.value = !_isExpanded.value;
  }
}
