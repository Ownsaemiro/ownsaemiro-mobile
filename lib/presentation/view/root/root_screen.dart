import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view/event/event_screen.dart';
import 'package:ownsaemiro/presentation/view/home/home_screen.dart';
import 'package:ownsaemiro/presentation/view/market/market_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/profile_screen.dart';
import 'package:ownsaemiro/presentation/view/root/widget/custom_bottom_navigation_bar.dart';
import 'package:ownsaemiro/presentation/view_model/root/root_view_model.dart';

class RootScreen extends BaseScreen<RootViewModel> {
  const RootScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Obx(() => IndexedStack(
          index: viewModel.selectedIndex,
          children: const [
            HomeScreen(),
            EventScreen(),
            MarketScreen(),
            ProfileScreen(),
          ],
        ));
  }

  @override
  Widget buildBottomNavigationBar(BuildContext context) {
    return const CustomBottomNavigationBar();
  }

  @override
  bool get setTopOuterSafeArea => false;

  @override
  bool get setBottomOuterSafeArea => false;
}
