import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view/home/widget/home/popular_event_item_widget.dart';
import 'package:ownsaemiro/presentation/view_model/home/home_view_model.dart';

class PopularEventWidget extends BaseWidget<HomeViewModel> {
  const PopularEventWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () {
        if (viewModel.isPopularEventLoading) {
          /// Todo: Add Skeleton Loading
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SizedBox(
          height: Get.width * 0.9,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.popularEventList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.EVENT_DETAIL,
                      arguments: viewModel.popularEventList[index].id);
                },
                child: Stack(
                  children: [
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                viewModel.popularEventList[index].image),
                            fit: BoxFit.cover),
                      ),
                      child: PopularEventItemWidget(
                        state: viewModel.popularEventList[index],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
