import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/utility/date_util.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/participated_event_view_model.dart';
import 'package:shimmer/shimmer.dart';

class ParticipatedEventListWidget
    extends BaseWidget<ParticipatedEventViewModel> {
  const ParticipatedEventListWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () {
        if (viewModel.isLoading) {
          return _buildShimmerList();
        }

        if (viewModel.state.isEmpty) {
          return const Center(
            child: Text('참여한 행사가 없습니다.'),
          );
        }

        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
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
                childCount: viewModel
                    .state.length, // Adjust the number of items as needed
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildShimmerList() {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
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
                          const SizedBox(height: 4),
                          Container(
                            width: 120,
                            height: 12,
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
            },
            childCount: 10, // Shimmer 아이템 수를 조절하세요
          ),
        ),
      ],
    );
  }
}
