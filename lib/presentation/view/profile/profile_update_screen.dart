import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/profile_view_model.dart';

class ProfileUpdateScreen extends GetView<ProfileViewModel> {
  const ProfileUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "프로필 수정",
              style: FontSystem.KR18B.copyWith(
                color: const Color(0xFF555555),
              ),
            ),
          ),
          centerTitle: true,
          surfaceTintColor: ColorSystem.white,
          automaticallyImplyLeading: true,
          titleSpacing: 0,
          leadingWidth: 50,
          leading: IconButton(
            padding: const EdgeInsets.only(top: 10, left: 10),
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              foregroundColor: ColorSystem.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            icon: const Icon(
              Icons.clear,
              size: 32,
              color: Color(0xFF555555),
            ),
            onPressed: () => Get.back(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: GestureDetector(
                onTap: () {
                  LogUtil.info("프로필 업데이트 완료");
                  Get.back();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      "완료",
                      style: TextStyle(
                        color: ColorSystem.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: const _ProfileWidget(),
    );
  }
}

class _ProfileWidget extends BaseWidget<ProfileViewModel> {
  const _ProfileWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              viewModel.pickImage();
            },
            child: Stack(
              children: [
                Obx(
                  () {
                    if (viewModel.isProfileImageUploading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: NetworkImage(
                            viewModel.userImageState.profileImage));
                  },
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorSystem.primary,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "닉네임",
              style: FontSystem.KR18N,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: viewModel.nicknameController,
            decoration: InputDecoration(
              hintText: '새로운 닉네임',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
