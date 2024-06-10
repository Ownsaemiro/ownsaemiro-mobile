import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/app/utility/date_util.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/data/model/event/search_event_state.dart';
import 'package:ownsaemiro/presentation/view/event/widget/category_chip_widget.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_search_appbar.dart';
import 'package:shimmer/shimmer.dart';

class EventScreen extends BaseScreen<EventViewModel> {
  const EventScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: DefaultSearchAppBar(),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryChipWidget(),
        SizedBox(height: 20),
        Expanded(
          child: Column(
            children: [
              // EventListTitleWidget(title: "진행 중인 공연"),
              Expanded(
                child: _EventListWidget(),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _EventListWidget extends BaseWidget<EventViewModel> {
  const _EventListWidget();

  @override
  Widget buildView(BuildContext context) {
    viewModel.scrollController.addListener(
      () {
        if (viewModel.scrollController.position.pixels ==
            viewModel.scrollController.position.maxScrollExtent) {
          viewModel.loadMoreData();
        }
      },
    );

    return Obx(
      () {
        if (viewModel.isLoading && viewModel.state.isEmpty) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.55,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              return const _SkeletonItem();
            },
          );
        }

        return GridView.builder(
          controller: viewModel.scrollController,
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.55,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: viewModel.state.length + (viewModel.isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == viewModel.state.length) {
              return const _SkeletonItem();
            }

            if (viewModel.state.isEmpty) {
              return const Center(
                child: Text('행사가 존재하지 않습니다.'),
              );
            }

            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.EVENT_DETAIL,
                    arguments: viewModel.state[index].eventId);
              },
              child: Center(
                child: EventItemWidget(state: viewModel.state[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key, required this.state});

  final SearchEventState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _EventItemImage(image: state.eventImage),
        const SizedBox(height: 8),
        _EventItemTitle(title: state.eventName),
        _EventItemLocation(address: state.address),
        _EventItemDate(date: state.duration),
      ],
    );
  }
}

class _EventItemImage extends StatelessWidget {
  const _EventItemImage({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25;
    final containerHeight = containerWidth * 1.4;

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
      child: const Center(),
    );
  }
}

class _EventItemTitle extends StatelessWidget {
  const _EventItemTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25;
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

class _EventItemLocation extends StatelessWidget {
  const _EventItemLocation({required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25;
    final textWidth = containerWidth;

    return SizedBox(
      width: textWidth,
      child: Text(
        address,
        style: const TextStyle(
            fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w500),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}

class _EventItemDate extends StatelessWidget {
  const _EventItemDate({required this.date});

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
      ),
    );
  }
}

class _SkeletonItem extends StatelessWidget {
  const _SkeletonItem();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25;
    final containerHeight = containerWidth * 1.4;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: containerWidth,
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: containerWidth,
            height: 20,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
