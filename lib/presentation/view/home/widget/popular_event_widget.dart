import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          final color = Colors.primaries[eventIndex % Colors.primaries.length];
          return Container(
            width: Get.width,
            color: color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                // Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    splitText("핫소스유니버스 팝업스토어"),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Pretendard',
                      color: Colors.white,
                    ),
                  ),
                ),

                // Date
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "5.10 ~ 5.12",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
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
