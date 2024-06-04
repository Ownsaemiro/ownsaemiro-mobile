import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/utility/date_util.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_view_model.dart';

class BeforeEventListWidget extends BaseWidget<EventViewModel> {
  const BeforeEventListWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25; // 화면 너비의 25%를 사용
    final containerHeight = containerWidth * 1.4; // 가로세로 비율 1:1.4
    final textWidth = containerWidth;

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: SizedBox(
        height: containerHeight + 80,
        child: Obx(
          () {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.beforeEventList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.EVENT_DETAIL);
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
                                  viewModel.beforeEventList[index].image),
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
                            viewModel.beforeEventList[index].title,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          width: textWidth, // 텍스트 너비를 제한
                          child: Text(
                            viewModel.beforeEventList[index].address,
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
                                viewModel.beforeEventList[index].duration),
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
