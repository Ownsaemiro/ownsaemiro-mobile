import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/root/root_view_model.dart';

class CustomBottomNavigationBar extends BaseWidget<RootViewModel> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(() => Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: viewModel.selectedIndex,
            onTap: viewModel.changeIndex,
            unselectedItemColor: Colors.grey[400],
            selectedItemColor: ColorSystem.primaryColor,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/home.svg',
                    height: 24,
                    colorFilter: viewModel.selectedIndex == 0
                        ? const ColorFilter.mode(
                            ColorSystem.primaryColor, BlendMode.srcATop)
                        : ColorFilter.mode(
                            Colors.grey[400]!, BlendMode.srcATop),
                  ),
                  label: '홈'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/transaction.svg',
                    height: 24,
                    colorFilter: viewModel.selectedIndex == 1
                        ? const ColorFilter.mode(
                            ColorSystem.primaryColor, BlendMode.srcATop)
                        : ColorFilter.mode(
                            Colors.grey[400]!, BlendMode.srcATop),
                  ),
                  label: '티켓구매'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/transfer.svg',
                    height: 24,
                    colorFilter: viewModel.selectedIndex == 2
                        ? const ColorFilter.mode(
                            ColorSystem.primaryColor, BlendMode.srcATop)
                        : ColorFilter.mode(
                            Colors.grey[400]!, BlendMode.srcATop),
                  ),
                  label: '티켓양도'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/info.svg',
                    height: 24,
                    colorFilter: viewModel.selectedIndex == 3
                        ? const ColorFilter.mode(
                            ColorSystem.primaryColor, BlendMode.srcATop)
                        : ColorFilter.mode(
                            Colors.grey[400]!, BlendMode.srcATop),
                  ),
                  label: '프로필'),
            ],
          ),
        ));
  }
}
