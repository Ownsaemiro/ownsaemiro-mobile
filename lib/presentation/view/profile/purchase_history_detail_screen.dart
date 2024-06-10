import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/presentation/view/profile/component/send_button_widget.dart';
import 'package:ownsaemiro/presentation/view/profile/widget/purchased_event_description_widget.dart';
import 'package:ownsaemiro/presentation/view/profile/widget/purchased_event_item_header_item.dart';
import 'package:ownsaemiro/presentation/view_model/profile/purchase_history_detail_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/profile/purchase_history_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

class PurchaseHistoryDetailScreen
    extends GetView<PurchaseHistoryDetailViewModel> {
  PurchaseHistoryDetailScreen({super.key});

  final int id = Get.arguments;
  final PurchaseHistoryViewModel viewModel =
      Get.find<PurchaseHistoryViewModel>();

  void _showModal(BuildContext context) {
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
                const SizedBox(height: 16),
                SvgPicture.asset(
                  'assets/icons/notify.svg',
                  height: 64,
                ),
                const SizedBox(height: 16),
                const Text(
                  '예매 취소 및 티켓 양도 등록이 완료되었습니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorSystem.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    '확인',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.setPurchasedHistoryDetailState(id);

    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: DefaultBackAppBar(
                title: controller.purchasedHistoryDetailState.title),
          ),
          body: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PurchasedEventItemHeaderItem(),
                PurchasedEventDescriptionWidget(),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  controller.cancelTicket();
                  _showModal(context);
                  viewModel.setPurchasedHistoryList();
                },
                child: const SendButtonWidget(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
