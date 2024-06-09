import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/utility/date_util.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_view_model.dart';

class DuringEventListWidget extends BaseWidget<EventViewModel> {
  const DuringEventListWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25;
    final containerHeight = containerWidth * 1.4;
    final textWidth = containerWidth;

    viewModel.duringScrollController.addListener(() {
      if (viewModel.duringScrollController.position.pixels ==
          viewModel.duringScrollController.position.maxScrollExtent) {
        viewModel.loadDuringEventMore();
      }
    });

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: SizedBox(
        height: containerHeight + 80,
        child: Obx(
          () {
            if (viewModel.isDuringEventLoading &&
                viewModel.duringEventList.isEmpty) {
              return const _SkeletonItem();
            }

            return ListView.builder(
              controller: viewModel.duringScrollController,
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.duringEventList.length +
                  (viewModel.isDuringEventMoreLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == viewModel.duringEventList.length) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: _SkeletonItem(),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.EVENT_DETAIL,
                          arguments: viewModel.duringEventList[index].id);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: containerWidth,
                          height: containerHeight,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  viewModel.duringEventList[index].image),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: textWidth,
                          child: Text(
                            viewModel.duringEventList[index].title,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          width: textWidth, // 텍스트 너비를 제한
                          child: Text(
                            viewModel.duringEventList[index].address,
                            style: const TextStyle(
                                fontSize: 10, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          width: textWidth, // 텍스트 너비를 제한
                          child: Text(
                            DateUtil.getDottedFormattedDate(
                                viewModel.duringEventList[index].duration),
                            style: const TextStyle(
                                fontSize: 10, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _SkeletonItem extends StatelessWidget {
  const _SkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25;
    final containerHeight = containerWidth * 1.4;
    final textWidth = containerWidth;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: textWidth,
                  height: 14,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  width: textWidth,
                  height: 10,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  width: textWidth,
                  height: 10,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
