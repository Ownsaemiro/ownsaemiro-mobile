import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/liked_event_view_model.dart';

class LikedEventListWidget extends BaseWidget<LikedEventViewModel> {
  const LikedEventListWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(() {
      if (viewModel.isLoaded) {
        return const Center(
          child: CircularProgressIndicator(
            color: ColorSystem.primary,
          ),
        );
      }

      if (viewModel.userLikedEventState.isEmpty) {
        return const Center(
          child: Text("좋아요한 이벤트가 없습니다."),
        );
      }

      return CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.EVENT_DETAIL,
                      arguments: viewModel.userLikedEventState[index].id);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  height: 100,
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          image: DecorationImage(
                            image: NetworkImage(
                                viewModel.userLikedEventState[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      // Add some spacing between image and text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            viewModel.userLikedEventState[index].name,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            viewModel.userLikedEventState[index].duration,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            LogUtil.info("좋아요");
                            viewModel.unlikeEvent(
                                viewModel.userLikedEventState[index].id);
                          },
                          icon: viewModel.userLikedEventState[index].isLiked
                              ? const Icon(Icons.favorite,
                                  color: ColorSystem.primary)
                              : const Icon(Icons.favorite_border,
                                  color: ColorSystem.primary)),
                    ],
                  ),
                ),
              );
            },
            childCount: viewModel.userLikedEventState
                .length, // Adjust the number of items as needed
          ),
        ),
      ]);
    });
  }
}
