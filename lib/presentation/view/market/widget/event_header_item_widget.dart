import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/data/model/market/ticket_detail_state.dart';
import 'package:ownsaemiro/presentation/view_model/market/market_detail_view_model.dart';

class EventHeaderItemWidget extends BaseWidget<MarketDetailViewModel> {
  const EventHeaderItemWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () {
        /// Todo: Skeleton UI Loading
        if (viewModel.isStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: [
            Container(
              width: Get.width,
              height: Get.width * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(viewModel.ticketDetailState.image),
                    fit: BoxFit.cover),
              ),
              child: const Center(),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(viewModel.ticketDetailState.title,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(height: 8),
                      Text(
                        '${viewModel.ticketDetailState.category} · ${viewModel.ticketDetailState.durationTime} · ${viewModel.ticketDetailState.rating}',
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
                              viewModel.ticketDetailState.address,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today,
                              color: ColorSystem.primary, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            viewModel.ticketDetailState.date,
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.phone,
                              color: ColorSystem.primary, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            viewModel.ticketDetailState.phoneNumber,
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
