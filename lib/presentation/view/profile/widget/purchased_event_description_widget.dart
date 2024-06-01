import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PurchasedEventDescriptionWidget extends StatelessWidget {
  const PurchasedEventDescriptionWidget({super.key});

  void _showQrDialog(BuildContext context) {
    /// Todo: Device Information으로 device_id 생성
    final Map<String, String> qrData = {
      'device_id': 'device_id',
      'event_id': 'event_id',
      'ticket_hash': 'ticket_hash',
      'user_id': 'user_id',
    };

    final String jsonQrData = jsonEncode(qrData);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            content: SizedBox(
              width: Get.width * 0.7,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QrImageView(data: jsonQrData),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 40),
                      backgroundColor: ColorSystem.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('닫기',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "예매 정보",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorSystem.primary,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '5월 10일 오후 2시',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "예매 번호 X4SDR45",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '좌석 정보 해당 없음',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _showQrDialog(context),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: ColorSystem.primary),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "티켓 확인",
                style: TextStyle(
                  color: ColorSystem.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
