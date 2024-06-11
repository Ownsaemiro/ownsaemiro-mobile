import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/utility/date_util.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/purchase_history_detail_view_model.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';

class PurchasedEventDescriptionWidget
    extends BaseWidget<PurchaseHistoryDetailViewModel> {
  const PurchasedEventDescriptionWidget({super.key});

  void _showQrDialog(BuildContext context) {
    final Map<String, String> qrData = {
      'device_id': viewModel.deviceId,
      'event_hash': viewModel.purchasedHistoryDetailState.ticketHash,
      'ticket_id': viewModel.purchasedHistoryDetailState.id.toString(),
      'user_id': viewModel.purchasedHistoryDetailState.userId.toString(),
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
                      viewModel.controller.setPurchasedHistoryList();
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
  Widget buildView(BuildContext context) {
    return Obx(() {
      if (viewModel.isLoading) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100,
                        height: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 150,
                        height: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 120,
                        height: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: 60,
                    height: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }

      return Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "예매 정보",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorSystem.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    DateUtil.getFormattedDateKo(
                        viewModel.purchasedHistoryDetailState.activatedAt),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "예매 번호 ${viewModel.purchasedHistoryDetailState.transactionId}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                DateTime now = DateTime.now();
                DateTime ticketDate = DateTime.parse(
                    viewModel.purchasedHistoryDetailState.activatedAt);

                if (now.isAfter(ticketDate)) {
                  Get.snackbar(
                    '티켓 확인 실패',
                    '만료된 티켓입니다.',
                    backgroundColor: Colors.white,
                    colorText: Colors.black,
                  );
                } else if (now.isBefore(ticketDate)) {
                  Get.snackbar(
                    '티켓 확인 실패',
                    '아직 사용할 수 없는 티켓입니다.',
                    backgroundColor: Colors.white,
                    colorText: Colors.black,
                  );
                } else {
                  _showQrDialog(context);
                  viewModel.controller.setPurchasedHistoryList();
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
    });
  }
}
