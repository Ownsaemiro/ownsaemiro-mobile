import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/data/model/profile/participated_event_state.dart';
import 'package:ownsaemiro/presentation/view_model/profile/participated_event_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

class ParticipatedDetailScreen extends BaseScreen<ParticipatedEventViewModel> {
  ParticipatedDetailScreen({super.key});

  final ParticipatedEventState state = Get.arguments;

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: DefaultBackAppBar(title: "참여한 행사"),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    final width = Get.width;

    return Center(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: Get.width * 0.8,
              height: Get.height * 0.5,
              margin: const EdgeInsets.all(16),
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
          ),
          const SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: viewModel.reviewController,
                    decoration: InputDecoration(
                      hintText: '공연의 후기를 작성해주세요.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                    ),
                    cursorColor: Colors.grey.shade700,
                    maxLines: 3,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                    onPressed: () {
                      LogUtil.info('Send Review');
                      viewModel.sendReview(state.id);
                      Get.snackbar(
                        "알림",
                        "후기가 등록되었습니다.",
                        backgroundColor: Colors.white,
                        colorText: Colors.black,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorSystem.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Icon(
                      size: 16,
                      Icons.send,
                      color: Colors.white,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
