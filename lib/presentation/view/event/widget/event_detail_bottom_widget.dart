import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_detail_view_model.dart';

class EventDetailBottomWidget extends BaseWidget<EventDetailViewModel> {
  const EventDetailBottomWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: () {
          viewModel.setRemainSeat(viewModel.eventDetailInfoState.id);
          Navigator.pushNamed(context, Routes.EVENT_RESERVATION);
        },
        child: Center(
          child: Column(
            children: [
              Container(
                width: Get.width * 0.9,
                height: 48,
                decoration: BoxDecoration(
                  color: ColorSystem.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "예매하기",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
