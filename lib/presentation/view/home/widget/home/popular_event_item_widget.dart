import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/utility/date_util.dart';
import 'package:ownsaemiro/data/model/event/popular_event_state.dart';

class PopularEventItemWidget extends StatelessWidget {
  const PopularEventItemWidget({super.key, required this.state});

  final PopularEventState state;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Spacer(),
      _PopularEventItemTitle(title: state.title),
      _PopularEventItemDate(date: state.duration),
      const SizedBox(height: 16)
    ]);
  }
}

class _PopularEventItemTitle extends StatelessWidget {
  const _PopularEventItemTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        splitText(title),
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }

  String splitText(String text) {
    return text.replaceAll(' ', '\n');
  }
}

class _PopularEventItemDate extends StatelessWidget {
  const _PopularEventItemDate({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(DateUtil.getDottedFormattedDate(date),
            style: const TextStyle(fontSize: 12, color: Colors.white)));
  }
}
