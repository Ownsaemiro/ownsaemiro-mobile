import 'package:flutter/material.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/widget/liked_event_list_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/liked_event_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

class LikedEventScreen extends BaseScreen<LikedEventViewModel> {
  const LikedEventScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DefaultBackAppBar(
          title: "내가 찜한",
        ));
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: LikedEventListWidget(),
        ),
      ],
    );
  }
}
