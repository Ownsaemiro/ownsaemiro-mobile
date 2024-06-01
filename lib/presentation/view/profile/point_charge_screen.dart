import 'package:flutter/material.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view_model/profile/point_charge_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

class PointChargeScreen extends BaseScreen<PointChargeViewModel> {
  const PointChargeScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DefaultBackAppBar(title: "포인트 충전"));
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text("포인트 충전"),
    );
  }
}
