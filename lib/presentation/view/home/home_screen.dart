import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view/home/widget/popular_event_widget.dart';
import 'package:ownsaemiro/presentation/view/home/widget/recommend_event_widget.dart';
import 'package:ownsaemiro/presentation/view_model/home/home_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_search_appbar.dart';

class HomeScreen extends BaseScreen<HomeViewModel> {
  const HomeScreen({super.key});

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
      const PopularEventWidget(),
      _name(),
      const RecommendEventWidget()
    ]));
  }

  Widget _name() => const Padding(
      padding: EdgeInsets.only(left: 25, top: 25),
      child: Text("이름 님을 위한 추천", style: FontSystem.KR18SB));
}
