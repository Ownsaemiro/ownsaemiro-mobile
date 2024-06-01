import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/config/font_system.dart';

class RecommendEventItemWidget extends StatelessWidget {
  const RecommendEventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RecommendEventItemImage(),
          SizedBox(height: 8),
          _RecommendEventItemTitle(),
          _RecommendEventItemLocation(),
          _RecommendEventItemDate(),
        ]);
  }
}

class _RecommendEventItemImage extends StatelessWidget {
  const _RecommendEventItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25; // 화면 너비의 25%를 사용
    final containerHeight = containerWidth * 1.4; // 가로세로 비율 1:1.4

    return Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(child: Text("이미지")));
  }
}

class _RecommendEventItemTitle extends StatelessWidget {
  const _RecommendEventItemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25; // 화면 너비의 25%를 사용
    final textWidth = containerWidth;

    return SizedBox(
        width: textWidth,
        child: const Text(
          "핫소스 유니버스 팝업스토어",
          style: FontSystem.KR14B,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ));
  }
}

class _RecommendEventItemLocation extends StatelessWidget {
  const _RecommendEventItemLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25; // 화면 너비의 25%를 사용
    final textWidth = containerWidth;

    return SizedBox(
        width: textWidth,
        child: const Text(
          "성수동2가 289-234(보) 1층 1호 여기에서 해요",
          style: TextStyle(
              fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ));
  }
}

class _RecommendEventItemDate extends StatelessWidget {
  const _RecommendEventItemDate({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25; // 화면 너비의 25%를 사용
    final textWidth = containerWidth;

    return SizedBox(
        width: textWidth,
        child: const Text(
          "5.10 ~ 5.12",
          style: TextStyle(
              fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
        ));
  }
}
