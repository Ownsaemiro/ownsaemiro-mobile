import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/assignment_waiting_view_model.dart';
import 'package:shimmer/shimmer.dart';

class AssignmentWaitingListWidget
    extends BaseWidget<AssignmentWaitingViewModel> {
  const AssignmentWaitingListWidget({super.key});

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
        if (viewModel.isLoading && viewModel.assignmentList.isEmpty) {
          return const _SkeletonItem();
        }

        if (viewModel.assignmentList.isEmpty) {
          return const Center(
            child: Text('신청한 양도 티켓이 없습니다.'),
          );
        }

        return CustomScrollView(
          controller: viewModel.scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == viewModel.assignmentList.length) {
                    return viewModel.isLoadingMore
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: _SkeletonItem(),
                          )
                        : const SizedBox.shrink();
                  }

                  return GestureDetector(
                    onTap: () {
                      if (viewModel.assignmentList[index].status == "수령 대기중") {
                        Get.toNamed(Routes.ASSIGNMENT_TICKET,
                            arguments: viewModel.assignmentList[index]);
                      } else if (viewModel.assignmentList[index].status ==
                          "낙첨") {
                        Get.snackbar("알림", "양도 티켓에 낙첨되었습니다.\n다음 기회에 다시 도전해주세요.",
                            backgroundColor: Colors.white,
                            colorText: Colors.black);
                      } else {
                        Get.snackbar("알림", "양도 티켓 추첨 대기중입니다.",
                            backgroundColor: Colors.white,
                            colorText: Colors.black);
                      }
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      viewModel.assignmentList[index].image),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          const SizedBox(width: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                viewModel.assignmentList[index].title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                viewModel.assignmentList[index].duration,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(viewModel.assignmentList[index].status,
                              style: TextStyle(
                                fontSize: 14,
                                color: viewModel.assignmentList[index].status ==
                                        "수령 대기중"
                                    ? ColorSystem.primary
                                    : viewModel.assignmentList[index].status ==
                                            "낙첨"
                                        ? const Color(0xFFEB5A5A)
                                        : const Color(0xFF555555),
                              )),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                  );
                },
                childCount: viewModel.assignmentList.length +
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
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
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
                ),
                Container(
                  width: 50,
                  height: 14,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
              ],
            ),
          );
        },
      ),
    );
  }
}
