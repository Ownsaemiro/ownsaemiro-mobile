import 'package:flutter/material.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_view_model.dart';

class EventScreen extends BaseScreen<EventViewModel> {
  const EventScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Event Screen'),
    );
  }
}
