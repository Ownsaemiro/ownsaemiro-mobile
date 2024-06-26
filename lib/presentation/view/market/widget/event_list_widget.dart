import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/market/market_view_model.dart';
import 'package:shimmer/shimmer.dart';

class EventListWidget extends BaseWidget<MarketViewModel> {
  const EventListWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    viewModel.scrollController.addListener(() {
      if (viewModel.scrollController.position.pixels ==
          viewModel.scrollController.position.maxScrollExtent) {
        viewModel.fetchMoreTickets();
      }
    });

    return Obx(
      () {
        if (viewModel.isStateLoading && viewModel.ticketList.isEmpty) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return const _SkeletonItem();
                  },
                  childCount: 10,
                ),
              ),
            ],
          );
        }

        if (viewModel.ticketList.isEmpty) {
          return const Center(
            child: Text("양도중인 티켓이 없습니다"),
          );
        }

        return CustomScrollView(
          controller: viewModel.scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == viewModel.ticketList.length) {
                    return viewModel.isLoadingMore
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: _SkeletonItem(),
                          )
                        : const SizedBox.shrink();
                  }

                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.MARKET_DETAIL,
                          arguments: viewModel.ticketList[index].id);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      height: 100,
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  viewModel.ticketList[index].image,
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ),
                            child: const Center(),
                          ),
                          const SizedBox(width: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                viewModel.ticketList[index].title,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                viewModel.ticketList[index].date,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: viewModel.ticketList.length +
                    (viewModel.isLoadingMore ? 1 : 0),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SkeletonItem extends StatelessWidget {
  const _SkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        height: 100,
        child: Row(
          children: [
            const SizedBox(width: 8),
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 16,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                Container(
                  width: 80,
                  height: 12,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
