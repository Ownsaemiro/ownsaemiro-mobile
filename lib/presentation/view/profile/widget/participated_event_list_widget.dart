import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';

class ParticipatedEventListWidget extends StatelessWidget {
  const ParticipatedEventListWidget({super.key});

  void _onTap() {
    LogUtil.info("티켓 다이얼로그");
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return GestureDetector(
              onTap: () {
                _onTap();
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                height: 120,
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
                        SizedBox(height: 4),
                        Text(
                          "구매일: 2024.05.10",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "예매 번호 X4SDR45",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
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
