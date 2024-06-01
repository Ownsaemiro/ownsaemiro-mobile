import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/presentation/view/market/component/send_button_widget.dart';
import 'package:ownsaemiro/presentation/view/market/widget/event_header_item_widget.dart';
import 'package:ownsaemiro/presentation/view/market/widget/event_item_description_widget.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

class MarketDetailScreen extends GetView<MarketDetailScreen> {
  const MarketDetailScreen({super.key});

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
                  'assets/icons/notify.svg', // 알림 아이콘 경로
                  height: 64,
                ),
                const SizedBox(height: 16),
                const Text(
                  '티켓 양도 신청이 완료되었습니다.',
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
    return Stack(
      children: [
        Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: DefaultBackAppBar(
              title: "",
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const EventHeaderItemWidget(),
                SizedBox(
                  width: double.infinity,
                  height: 1,
                  child: Container(
                    color: Colors.grey.shade200,
                  ),
                ),
                const EventItemDescriptionWidget(),
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
                    _showModal(context);
                  },
                  child: const SendButtonWidget())
            ],
          ),
        ),
      ],
    );
  }
}