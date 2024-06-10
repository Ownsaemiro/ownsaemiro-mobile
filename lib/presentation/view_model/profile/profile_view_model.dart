import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ownsaemiro/data/model/profile/profile_update_state.dart';
import 'package:ownsaemiro/data/model/user/user_image_state.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository.dart';
import 'package:ownsaemiro/data/repository/user/user_repository.dart';
import 'package:ownsaemiro/presentation/view_model/root/root_view_model.dart';

class ProfileViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;
  late final TextEditingController nicknameController;
  late final RootViewModel _rootViewModel;
  late final ProfileRepository _profileRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late Rx<UserImageState> _userImageState;
  late final RxBool _isProfileImageUploading = false.obs;
  late final Rxn<XFile?> _image;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  UserImageState get userImageState => _userImageState.value;

  bool get isProfileImageUploading => _isProfileImageUploading.value;

  XFile? get image => _image.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _userRepository = Get.find<UserRepository>();
    _rootViewModel = Get.find<RootViewModel>();
    _profileRepository = Get.find<ProfileRepository>();

    // Initialize State
    _userImageState = UserImageState(profileImage: "").obs;
    nicknameController =
        TextEditingController(text: _rootViewModel.userNameState.name);

    _image = Rxn<XFile?>();
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

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _image.value = image;
    }
  }

  void getImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      _image.value = image;
    }
  }

  void clearProfileImage() {
    _image.value = null;
  }

  void updateProfile() async {
    ProfileUpdateState result;

    if (_image.value == null) {
      result = await _profileRepository.updateProfile(
          nickname: nicknameController.text);
    } else {
      result = await _profileRepository.updateProfile(
        nickname: nicknameController.text,
        image: File(_image.value!.path),
      );
    }

    _userImageState
        .update((value) => value!.copyWith(profileImage: result.image));
    _userImageState.value = UserImageState(profileImage: result.image);
    _rootViewModel.updateUserName(result.name);

    nicknameController.text = "";
  }
}
