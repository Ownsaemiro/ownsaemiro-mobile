import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/utility/date_util.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view/market/widget/event_list_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/participated_event_view_model.dart';
import 'package:shimmer/shimmer.dart';

class ParticipatedEventListWidget
    extends BaseWidget<ParticipatedEventViewModel> {
  const ParticipatedEventListWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    viewModel.scrollController.addListener(
      () {
        if (viewModel.scrollController.position.pixels ==
            viewModel.scrollController.position.maxScrollExtent) {
          viewModel.fetchMoreData();
        }
      },
    );

    return Obx(
      () {
        if (viewModel.isLoading && viewModel.state.isEmpty) {
          return const _SkeletonItem();
        }

        if (viewModel.state.isEmpty) {
          return const Center(
            child: Text('참여한 행사가 없습니다.'),
          );
        }

        return CustomScrollView(
          controller: viewModel.scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == viewModel.state.length) {
                    return viewModel.isLoadingMore
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: _SkeletonItem(),
                          )
                        : const SizedBox.shrink();
                  }

                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.PARTICIPATED_DETAIL,
                          arguments: viewModel.state[index]);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      height: 120,
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  viewModel.state[index].image,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                viewModel.state[index].title,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                DateUtil.getDottedDate(
                                    viewModel.state[index].activatedAt),
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "구매일: ${DateUtil.getDottedDate(viewModel.state[index].boughtAt)}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "예매 번호 ${viewModel.state[index].transactionId}",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount:
                    viewModel.state.length + (viewModel.isLoadingMore ? 1 : 0),
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
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 100,
                    height: 12,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
