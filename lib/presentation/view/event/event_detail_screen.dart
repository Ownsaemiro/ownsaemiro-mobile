import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/presentation/view/event/widget/event_detail_bottom_widget.dart';
import 'package:ownsaemiro/presentation/view/event/widget/event_detail_middle_widget.dart';
import 'package:ownsaemiro/presentation/view/event/widget/event_detail_top_widget.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_detail_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

/// Todo: id 연결
class EventDetailScreen extends GetView<EventDetailViewModel> {
  const EventDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    controller.setEventDetailInfoState(id);

    return Stack(
      children: [
        Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: DefaultBackAppBar(title: ""),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EventDetailTopWidget(id: id),
                const EventDetailMiddleWidget(),
              ],
            ),
          ),
        ),
        const Positioned(
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
