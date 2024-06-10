import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/data/model/profile/participated_event_state.dart';
import 'package:ownsaemiro/presentation/view_model/profile/participated_event_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

class ParticipatedDetailScreen extends BaseScreen<ParticipatedEventViewModel> {
  ParticipatedDetailScreen({super.key});

  final ParticipatedEventState state = Get.arguments;

  @override
  bool get wrapWithInnerSafeArea => true;

  @override
  bool get setBottomInnerSafeArea => true;

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: DefaultBackAppBar(title: "참여한 행사"),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          _buildImageView(),
          const Spacer(),
          _buildTextInputView(),
          const Spacer(),
          _buildRegisterButton(),
        ],
      ),
    );
  }

  Widget _buildImageView() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: Get.width * 0.8,
        height: Get.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(state.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    state.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.activatedAt,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextInputView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
      child: TextField(
        controller: viewModel.reviewController,
        decoration: InputDecoration(
          hintText: '공연의 후기를 작성해주세요.',
          hintStyle: FontSystem.KR14M.copyWith(
            color: Colors.grey.shade500,
          ),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: Colors.grey.shade200,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        cursorColor: Colors.grey.shade700,
        maxLines: 5,
        style: FontSystem.KR14M,
      ),
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      width: Get.width * 0.8,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressRegisterButton,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorSystem.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          "후기 등록하기",
          style: FontSystem.KR20M.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  void onPressRegisterButton() {
    if (viewModel.reviewController.text.isEmpty) {
      Get.snackbar(
        "알림",
        "후기를 작성해주세요.",
        backgroundColor: ColorSystem.neutral.withOpacity(0.3),
        colorText: Colors.black,
        duration: const Duration(seconds: 1, milliseconds: 500),
      );

      return;
    }

    viewModel.sendReview(state.id);
    Get.snackbar(
      "알림",
      "후기가 등록되었습니다.",
      backgroundColor: Colors.white,
      colorText: Colors.black,
    );
  }
}
