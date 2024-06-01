import 'package:flutter/material.dart';

class PopularEventItemWidget extends StatelessWidget {
  const PopularEventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          _PopularEventItemTitle(),
          _PopularEventItemDate(),
          SizedBox(height: 16)
        ]);
  }
}

class _PopularEventItemTitle extends StatelessWidget {
  const _PopularEventItemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(splitText("핫소스유니버스 팝업스토어"),
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white)));
  }

  String splitText(String text) {
    return text.replaceAll(' ', '\n');
  }
}

class _PopularEventItemDate extends StatelessWidget {
  const _PopularEventItemDate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text("5.10 ~ 5.12",
            style: TextStyle(fontSize: 12, color: Colors.white)));
  }
}
