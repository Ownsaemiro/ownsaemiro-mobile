import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/utility/date_util.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/purchase_history_view_model.dart';
import 'package:shimmer/shimmer.dart';

class PurchaseHistoryListWidget extends BaseWidget<PurchaseHistoryViewModel> {
  const PurchaseHistoryListWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    viewModel.scrollController.addListener(() {
      if (viewModel.scrollController.position.pixels ==
          viewModel.scrollController.position.maxScrollExtent) {
        viewModel.fetchMoreData();
      }
    });

    return Obx(
      () {
        if (viewModel.isLoading) {
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            const SizedBox(width: 24),
                            Column(
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
                                  width: 150,
                                  height: 12,
                                  color: Colors.white,
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  width: 180,
                                  height: 12,
                                  color: Colors.white,
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  width: 160,
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
                  childCount: 10,
                ),
              ),
            ],
          );
        }

        if (viewModel.purchasedHistoryList.isEmpty) {
          return const Center(
            child: Text('구매한 티켓이 없습니다.'),
          );
        }

        return CustomScrollView(
          controller: viewModel.scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == viewModel.purchasedHistoryList.length) {
                    return viewModel.isLoadingMore
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: ColorSystem.primary,
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  }

                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.PURCHASE_HISTORY_DETAIL,
                          arguments: viewModel.purchasedHistoryList[index].id);
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
                                image: NetworkImage(viewModel
                                    .purchasedHistoryList[index].image),
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
                                viewModel.purchasedHistoryList[index].title,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                DateUtil.getDottedDate(
                                    viewModel.purchasedHistoryList[index].date),
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "구매일: ${DateUtil.getDottedDate(viewModel.purchasedHistoryList[index].purchasedDate)}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "예매 번호 ${viewModel.purchasedHistoryList[index].transactionId}",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: viewModel.purchasedHistoryList.length +
                    1, // Adjust the number of items as needed
              ),
            ),
          ],
        );
      },
    );
  }
}
