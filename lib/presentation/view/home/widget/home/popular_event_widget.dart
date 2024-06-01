import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/presentation/view/home/widget/home/popular_event_item_widget.dart';

class PopularEventWidget extends StatelessWidget {
  const PopularEventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width * 0.9,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final eventIndex = index % 3;
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.EVENT_DETAIL);
            },
            child: Stack(
              children: [
                Container(
                  width: Get.width,
                  color: Colors.grey,
                  child: const PopularEventItemWidget(),
                ),
                const Center(child: Text("이미지")),
              ],
            ),
          );
        },
      ),
    );
  }

  String splitText(String text) {
    return text.replaceAll(' ', '\n');
  }
}
