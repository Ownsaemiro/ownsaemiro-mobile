import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/point_charge_view_model.dart';

class PointChargeScreen extends GetView<PointChargeViewModel> {
  const PointChargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "포인트 충전",
              style: FontSystem.KR18B.copyWith(
                color: const Color(0xFF555555),
              ),
            ),
          ),
          centerTitle: true,
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: true,
          titleSpacing: 0,
          leadingWidth: 50,
          leading: IconButton(
            padding: const EdgeInsets.only(top: 10, left: 10),
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            icon: const Icon(
              Icons.clear,
              size: 32,
              color: Color(0xFF555555),
            ),
            onPressed: () {
              controller.clear();
              Get.back();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: GestureDetector(
                onTap: () {
                  controller.chargePoint();
                  Get.back();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      "완료",
                      style: TextStyle(
                        color: ColorSystem.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: const _PointChargeWidget(),
    );
  }
}

class _PointChargeWidget extends BaseWidget<PointChargeViewModel> {
  const _PointChargeWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: Get.width * 0.2),
          Obx(
            () {
              return Text(
                '${viewModel.formattedPoint} Coin',
                style: FontSystem.KR24B.copyWith(
                  color: const Color(0xFF555555),
                ),
              );
            },
          ),
          const Spacer(),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                if (index < 9) {
                  return _NumberButton(number: index + 1);
                } else if (index == 9) {
                  return _ActionButton(
                    icon: Icons.backspace,
                    onPressed: viewModel.removeDigit,
                  );
                } else if (index == 10) {
                  return const _NumberButton(number: 0);
                } else {
                  return _ActionButton(
                    icon: Icons.clear,
                    onPressed: viewModel.clear,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _NumberButton extends BaseWidget<PointChargeViewModel> {
  final int number;

  const _NumberButton({super.key, required this.number});

  @override
  Widget buildView(BuildContext context) {
    return GestureDetector(
      onTap: () {
        viewModel.addDigit(number);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            "$number",
            style: FontSystem.KR24B.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends BaseWidget<PointChargeViewModel> {
  final IconData icon;
  final VoidCallback onPressed;

  const _ActionButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget buildView(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
    );
  }
}
