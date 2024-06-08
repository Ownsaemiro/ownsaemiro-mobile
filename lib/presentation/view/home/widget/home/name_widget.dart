import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/root/root_view_model.dart';
import 'package:shimmer/shimmer.dart';

class NameWidget extends BaseWidget<RootViewModel> {
  const NameWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () {
        if (viewModel.isUserNameLoading) {
          return Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 200,
                height: 24,
                color: Colors.white,
              ),
            ),
          );
        }

        return Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: Text("${viewModel.userNameState.name} 님을 위한 추천",
                style: FontSystem.KR18SB));
      },
    );
  }
}
