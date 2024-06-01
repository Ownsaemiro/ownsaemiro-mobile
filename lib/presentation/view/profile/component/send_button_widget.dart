import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';

class SendButtonWidget extends StatelessWidget {
  const SendButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
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
                  "예매 취소 및 양도",
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
    );
  }
}
