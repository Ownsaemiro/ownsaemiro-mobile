import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/root/root_view_model.dart';

class NameWidget extends BaseWidget<RootViewModel> {
  const NameWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25),
      child: Obx(
        () => Text("${viewModel.name} 님을 위한 추천", style: FontSystem.KR18SB),
      ),
    );
  }
}
