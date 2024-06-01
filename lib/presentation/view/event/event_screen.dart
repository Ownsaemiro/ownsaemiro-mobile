import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view/event/component/event_list_title_widget.dart';
import 'package:ownsaemiro/presentation/view/event/widget/category_chip_widget.dart';
import 'package:ownsaemiro/presentation/view/event/widget/event_list_widget.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_search_appbar.dart';

class EventScreen extends BaseScreen<EventViewModel> {
  const EventScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: DefaultSearchAppBar(),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _TopWidget(),
      _MiddleWidget(),
      SizedBox(height: 20),
      _BottomWidget(),
    ]));
  }
}

class _TopWidget extends StatelessWidget {
  const _TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryChipWidget();
  }
}

class _MiddleWidget extends StatelessWidget {
  const _MiddleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [EventListTitleWidget(title: "진행 중인 공연"), EventListWidget()]);
  }
}

class _BottomWidget extends StatelessWidget {
  const _BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EventListTitleWidget(title: "진행 예정인 공연"),
          EventListWidget()
        ]);
  }
}
