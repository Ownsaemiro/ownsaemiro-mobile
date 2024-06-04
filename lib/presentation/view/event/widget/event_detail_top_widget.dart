import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_detail_view_model.dart';

class EventDetailTopWidget extends BaseWidget<EventDetailViewModel> {
  const EventDetailTopWidget({super.key, required this.id});

  final int id;

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () {
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
                      Row(children: [
                        Text(
                          viewModel.eventDetailInfoState.title,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        // viewModel.eventDetailInfoState.isLiked
                        viewModel.eventDetailInfoState.isLiked
                            ? const Icon(Icons.favorite,
                                color: ColorSystem.primary, size: 32)
                            : const Icon(Icons.favorite_border,
                                color: ColorSystem.primary, size: 32),
                      ]),
                      const SizedBox(height: 8),
                      Text(
                        '${viewModel.eventDetailInfoState.category} · ${viewModel.eventDetailInfoState.durationTime} · ${viewModel.eventDetailInfoState.rating}',
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
                            viewModel.eventDetailInfoState.phoneNumber,
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
