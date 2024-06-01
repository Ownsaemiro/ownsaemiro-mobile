import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/config/color_system.dart';

class AssignmentWaitingListWidget extends StatelessWidget {
  const AssignmentWaitingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return GestureDetector(
              onTap: () {},
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
                    // const Text(
                    //   "낙첨",
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     color: Color(0xFF999999),
                    //   ),
                    // ),
                    const Text(
                      "대기",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF555555),
                      ),
                    ),
                    // const Text(
                    //   "수령 대기 중",
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     color: ColorSystem.primary,
                    //   ),
                    // ),
                    const SizedBox(width: 8),
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
