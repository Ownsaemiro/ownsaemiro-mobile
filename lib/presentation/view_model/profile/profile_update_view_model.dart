import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateViewModel extends GetxController {
  var profileImage = Rx<XFile?>(null);
  final TextEditingController nicknameController = TextEditingController();

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
