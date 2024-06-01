import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/config/font_system.dart';

class EventListTitleWidget extends StatelessWidget {
  final String title;

  const EventListTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, top: 25),
        child: Text(title, style: FontSystem.KR18SB));
  }
}
