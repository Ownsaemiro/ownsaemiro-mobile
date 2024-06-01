import 'package:flutter/material.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/widget/assignment_waiting_list_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/assignment_waiting_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

class AssignmentWaitingScreen extends BaseScreen<AssignmentWaitingViewModel> {
  const AssignmentWaitingScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: DefaultBackAppBar(title: "양도 대기 목록"),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AssignmentWaitingListWidget(),
        ),
      ],
    );
  }
}
