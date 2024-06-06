import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ownsaemiro/data/model/user/user_image_state.dart';
import 'package:ownsaemiro/data/repository/user/user_repository.dart';
import 'package:ownsaemiro/presentation/view_model/root/root_view_model.dart';

class ProfileViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;
  final TextEditingController nicknameController = TextEditingController();
  late final RootViewModel _rootViewModel;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final Rx<UserImageState> _userImageState;
  late final RxBool _isProfileImageUploading = false.obs;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  UserImageState get userImageState => _userImageState.value;

  bool get isProfileImageUploading => _isProfileImageUploading.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _userRepository = Get.find<UserRepository>();
    _rootViewModel = Get.find<RootViewModel>();

    // Initialize State
    _userImageState = UserImageState(profileImage: "").obs;
    nicknameController.text = _rootViewModel.userNameState.name;
  }

  @override
  void onReady() async {
    super.onReady();

    _isProfileImageUploading.value = true;

    await _userRepository.getUserProfile().then((value) {
      _userImageState.value = value;
    });

    _isProfileImageUploading.value = false;
  }

  var profileImage = Rx<XFile?>(null);

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      profileImage.value = image;
    }
  }

  void clearProfileImage() {
    profileImage.value = null;
  }
}
