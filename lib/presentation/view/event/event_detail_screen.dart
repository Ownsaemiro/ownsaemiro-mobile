import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/presentation/view/event/widget/event_detail_bottom_widget.dart';
import 'package:ownsaemiro/presentation/view/event/widget/event_detail_middle_widget.dart';
import 'package:ownsaemiro/presentation/view/event/widget/event_detail_top_widget.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_detail_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

/// Todo: id 연결
class EventDetailScreen extends GetView<EventDetailViewModel> {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: DefaultBackAppBar(title: ""),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EventDetailTopWidget(),
                EventDetailMiddleWidget(),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EventDetailBottomWidget(),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
