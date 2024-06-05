import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/market/market_detail_view_model.dart';

class EventItemDescriptionWidget extends BaseWidget<MarketDetailViewModel> {
  const EventItemDescriptionWidget({super.key});

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

        return Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "공연 내용 요약",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                viewModel.ticketDetailState.description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
