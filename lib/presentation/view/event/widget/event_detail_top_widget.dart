import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/utility/string_util.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_detail_view_model.dart';

class EventDetailTopWidget extends BaseWidget<EventDetailViewModel> {
  const EventDetailTopWidget({super.key, required this.id});

  final int id;

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () {
        if (viewModel.isEventDetailLoading) {
          return Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: Get.width,
                  height: Get.width * 0.6,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 150,
                        height: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100,
                        height: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        return Column(
          children: [
            Container(
              width: Get.width,
              height: Get.width * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(viewModel.eventDetailInfoState.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            viewModel.eventDetailInfoState.title,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              viewModel.pushLikeButton();
                            },
                            child: viewModel.eventDetailInfoState.isLiked
                                ? const Icon(Icons.favorite,
                                    color: ColorSystem.primary, size: 32)
                                : const Icon(Icons.favorite_border,
                                    color: ColorSystem.primary, size: 32),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${StringUtil.getCategoryKoName(viewModel.eventDetailInfoState.category)} · ${viewModel.eventDetailInfoState.durationTime} · ${viewModel.eventDetailInfoState.rating}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: ColorSystem.primary, size: 18),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              viewModel.eventDetailInfoState.address,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(children: [
                        const Icon(Icons.calendar_today,
                            color: ColorSystem.primary, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          viewModel.eventDetailInfoState.duration,
                          style: const TextStyle(fontSize: 10),
                        )
                      ]),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.phone,
                              color: ColorSystem.primary, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            StringUtil.getFormattedPhoneNumber(
                                viewModel.eventDetailInfoState.phoneNumber),
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
