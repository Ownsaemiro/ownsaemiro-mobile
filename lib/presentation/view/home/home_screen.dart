import 'package:flutter/material.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view/home/widget/home/name_widget.dart';
import 'package:ownsaemiro/presentation/view/home/widget/home/popular_event_widget.dart';
import 'package:ownsaemiro/presentation/view/home/widget/home/recommend_event_widget.dart';
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
    return const SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _TopWidget(),
      _MiddleWidget(),
      _BottomWidget(),
    ]));
  }
}

class _TopWidget extends StatelessWidget {
  const _TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopularEventWidget();
  }
}

class _MiddleWidget extends StatelessWidget {
  const _MiddleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const NameWidget();
  }
}

class _BottomWidget extends StatelessWidget {
  const _BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecommendEventWidget();
  }
}
