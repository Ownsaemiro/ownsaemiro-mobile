import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/root/root_view_model.dart';

class CustomBottomNavigationBar extends BaseWidget<RootViewModel> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        child: Container(
          height: Platform.isAndroid ? 80 : 112,
          decoration: BoxDecoration(
            color: ColorSystem.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            border: const Border(
              top: BorderSide(
                color: Color(0xFFDBDBE6),
                width: 1,
              ),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFDBDBE6),
                blurRadius: 10,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: BottomNavigationBar(
              // Bottom Navigation Bar State
              currentIndex: viewModel.selectedIndex,
              onTap: viewModel.changeIndex,

              // Background Design
              backgroundColor: ColorSystem.white,
              type: BottomNavigationBarType.fixed,

              // When not selected
              unselectedItemColor: ColorSystem.neutral.shade200,
              unselectedLabelStyle: FontSystem.KR12B,

              // When selected
              selectedLabelStyle: FontSystem.KR12B,
              selectedItemColor: ColorSystem.primary.shade500,

              // Items
              items: [
                BottomNavigationBarItem(
                    icon: icon(
                      context: context,
                      iconPath: 'assets/icons/home.svg',
                      color: viewModel.selectedIndex == 0
                          ? ColorSystem.primary.shade500
                          : ColorSystem.neutral.shade200,
                      height: 24,
                      bottomPadding: 2,
                    ),
                    label: "홈"),
                BottomNavigationBarItem(
                    icon: icon(
                      context: context,
                      iconPath: 'assets/icons/transaction.svg',
                      color: viewModel.selectedIndex == 1
                          ? ColorSystem.primary.shade500
                          : ColorSystem.neutral.shade200,
                      height: 24,
                      bottomPadding: 2,
                    ),
                    label: "티켓 판매"),
                BottomNavigationBarItem(
                    icon: icon(
                      context: context,
                      iconPath: 'assets/icons/transfer.svg',
                      color: viewModel.selectedIndex == 2
                          ? ColorSystem.primary.shade500
                          : ColorSystem.neutral.shade200,
                      height: 24,
                      bottomPadding: 2,
                    ),
                    label: "티켓 양도"),
                BottomNavigationBarItem(
                    icon: icon(
                      context: context,
                      iconPath: 'assets/icons/info.svg',
                      color: viewModel.selectedIndex == 3
                          ? ColorSystem.primary.shade500
                          : ColorSystem.neutral.shade200,
                      height: 24,
                      bottomPadding: 2,
                    ),
                    label: "프로필"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget icon({
    required BuildContext context,
    required String iconPath,
    required Color color,
    required double height,
    double bottomPadding = 0,
  }) =>
      SizedBox(
        height: height + bottomPadding,
        child: Column(
          children: [
            Flexible(
              child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context).loadString(iconPath),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      String data = snapshot.data!;
                      String newColor =
                          '#${color.value.toRadixString(16).substring(2).padLeft(6, '0').toUpperCase()}';

                      // Change Stroke Color in SVG
                      if (iconPath.contains('home.svg') ||
                          iconPath.contains('transaction.svg') ||
                          iconPath.contains('transfer.svg')) {
                        data = data.replaceAll(
                            RegExp(r'stroke="[^"]+"'), 'stroke="$newColor"');
                        data = data.replaceAll(
                            RegExp(r'stroke:#?[0-9a-fA-F]{3,6};'),
                            'stroke:$newColor;');
                        // Change Fill Color in SVG
                      } else if (iconPath.contains('info.svg')) {
                        data = data.replaceAll(
                            RegExp(r'fill="[^"]+"'), 'fill="$newColor"');
                        data = data.replaceAll(
                            RegExp(r'fill:#?[0-9a-fA-F]{3,6};'),
                            'fill:$newColor;');
                      }

                      return SvgPicture.string(
                        data,
                        height: height,
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            if (bottomPadding != 0) SizedBox(height: bottomPadding),
          ],
        ),
      );
}
