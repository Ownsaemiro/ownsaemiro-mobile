import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/app/utility/date_util.dart';
import 'package:ownsaemiro/data/model/event/recommend_event_state.dart';

class RecommendEventItemWidget extends StatelessWidget {
  const RecommendEventItemWidget({super.key, required this.state});

  final RecommendEventState state;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _RecommendEventItemImage(image: state.image),
      const SizedBox(height: 8),
      _RecommendEventItemTitle(title: state.title),
      _RecommendEventItemLocation(address: state.address),
      _RecommendEventItemDate(date: state.duration),
    ]);
  }
}

class _RecommendEventItemImage extends StatelessWidget {
  const _RecommendEventItemImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25; // 화면 너비의 25%를 사용
    final containerHeight = containerWidth * 1.4; // 가로세로 비율 1:1.4

    return Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center());
  }
}

class _RecommendEventItemTitle extends StatelessWidget {
  const _RecommendEventItemTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25; // 화면 너비의 25%를 사용
    final textWidth = containerWidth;

    return SizedBox(
        width: textWidth,
        child: Text(
          title,
          style: FontSystem.KR14B,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ));
  }
}

class _RecommendEventItemLocation extends StatelessWidget {
  const _RecommendEventItemLocation({super.key, required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25; // 화면 너비의 25%를 사용
    final textWidth = containerWidth;

    return SizedBox(
        width: textWidth,
        child: Text(
          address,
          style: const TextStyle(
              fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ));
  }
}

class _RecommendEventItemDate extends StatelessWidget {
  const _RecommendEventItemDate({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25; // 화면 너비의 25%를 사용
    final textWidth = containerWidth;

    return SizedBox(
        width: textWidth,
        child: Text(
          DateUtil.getDottedFormattedDate(date),
          style: const TextStyle(
              fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w500),
        ));
  }
}
