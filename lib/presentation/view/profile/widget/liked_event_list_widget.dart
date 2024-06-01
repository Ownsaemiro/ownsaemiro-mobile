import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';

class LikedEventListWidget extends StatelessWidget {
  const LikedEventListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.EVENT_DETAIL);
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                height: 100,
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Container(
                      width: 72,
                      height: 72,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.grey,
                      ),
                      child: const Center(child: Text('이미지')),
                    ),
                    const SizedBox(width: 24),
                    // Add some spacing between image and text
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '핫소스유니버스 팝업스토어',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '2024.05.10',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          LogUtil.info("좋아요");
                        },
                        icon: const Icon(Icons.favorite_border,
                            color: ColorSystem.primary)),
                  ],
                ),
              ),
            );
          },
          childCount: 20, // Adjust the number of items as needed
        ),
      ),
    ]);
  }
}
