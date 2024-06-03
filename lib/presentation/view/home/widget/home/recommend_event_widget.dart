import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view/home/widget/home/recommend_event_item_widget.dart';
import 'package:ownsaemiro/presentation/view_model/home/home_view_model.dart';

class RecommendEventWidget extends BaseWidget<HomeViewModel> {
  const RecommendEventWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25; // 화면 너비의 25%를 사용
    final containerHeight = containerWidth * 1.4; // 가로세로 비율 1:1.4

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: SizedBox(
        height: containerHeight + 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: viewModel.recommendEventList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.EVENT_DETAIL);
                },
                child: Obx(
                  () {
                    return RecommendEventItemWidget(
                        state: viewModel.recommendEventList[index]);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
