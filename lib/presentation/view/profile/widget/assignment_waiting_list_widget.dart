import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/assignment_waiting_view_model.dart';
import 'package:shimmer/shimmer.dart';

class AssignmentWaitingListWidget
    extends BaseWidget<AssignmentWaitingViewModel> {
  const AssignmentWaitingListWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () {
        if (viewModel.isLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListView.builder(
              itemCount: 10,
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

        if (viewModel.assignmentList.isEmpty) {
          return const Center(
            child: Text('신청한 양도 티켓이 없습니다.'),
          );
        }

        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
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
                              style: const TextStyle(fontSize: 16),
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
                                      ? const Color(0xFF999999)
                                      : const Color(0xFF555555),
                            )),
                        const SizedBox(width: 8),
                      ],
                    ),
                  );
                },
                childCount: viewModel.assignmentList
                    .length, // Adjust the number of items as needed
              ),
            ),
          ],
        );
      },
    );
  }
}
