import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
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
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const CategoryChipWidget(),
      _processing(),
      const EventListWidget(),
      const SizedBox(height: 20),
      _upcoming(),
      const EventListWidget()
    ]));
  }

  Widget _processing() => const Padding(
      padding: EdgeInsets.only(left: 25, top: 25),
      child: Text("진행 중인 공연", style: FontSystem.KR18SB));

  Widget _upcoming() => const Padding(
      padding: EdgeInsets.only(left: 25, top: 25),
      child: Text("진행 예정인 공연", style: FontSystem.KR18SB));
}
