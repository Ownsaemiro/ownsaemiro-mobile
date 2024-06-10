import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view_model/root/root_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';
import 'package:shimmer/shimmer.dart';

class NotificationScreen extends BaseScreen<RootViewModel> {
  const NotificationScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DefaultBackAppBar(title: "알림"));
  }

  @override
  Widget buildBody(BuildContext context) {
    viewModel.scrollController.addListener(
      () {
        if (viewModel.scrollController.position.pixels ==
            viewModel.scrollController.position.maxScrollExtent) {
          viewModel.loadMore();
        }
      },
    );

    return Obx(
      () {
        if (viewModel.isLoading && viewModel.notificationList.isEmpty) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 20,
            itemBuilder: (context, index) {
              return const _SkeletonNotificationItem();
            },
          );
        }

        if (viewModel.notificationList.isEmpty) {
          return const Center(child: Text('알림이 없습니다,'));
        }

        return AnimatedList(
          padding: const EdgeInsets.all(16),
          controller: viewModel.scrollController,
          key: viewModel.listKey,
          initialItemCount:
              viewModel.notificationList.length + (viewModel.isLoading ? 1 : 0),
          itemBuilder: (context, index, animation) {
            if (index == viewModel.notificationList.length) {
              return FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  child: const _SkeletonNotificationItem(),
                ),
              );
            }

            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/notify.svg',
                          height: 42,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                viewModel.notificationList[index].title,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                viewModel.notificationList[index].body,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                                overflow: TextOverflow.clip,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.grey),
                          onPressed: () => viewModel.deleteNotification(index),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _SkeletonNotificationItem extends StatelessWidget {
  const _SkeletonNotificationItem();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 42,
                height: 42,
                color: Colors.white,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 14,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      height: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 24,
                height: 24,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
