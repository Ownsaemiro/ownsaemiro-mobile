import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/utility/string_util.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/purchase_history_detail_view_model.dart';
import 'package:shimmer/shimmer.dart';

class PurchasedEventItemHeaderItem
    extends BaseWidget<PurchaseHistoryDetailViewModel> {
  const PurchasedEventItemHeaderItem({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () {
        if (viewModel.isLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: Get.width * 0.6,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 24,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 250,
                        height: 14,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Container(
                              width: 150,
                              height: 10,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 100,
                            height: 10,
                            color: Colors.white,
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 120,
                            height: 10,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Container(
              width: Get.width,
              height: Get.width * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      NetworkImage(viewModel.purchasedHistoryDetailState.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(viewModel.purchasedHistoryDetailState.title,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(height: 8),
                      Text(
                        '${StringUtil.getCategoryKoName(viewModel.purchasedHistoryDetailState.category)} · ${viewModel.purchasedHistoryDetailState.durationTime} · ${viewModel.purchasedHistoryDetailState.rating}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: ColorSystem.primary, size: 18),
                          const SizedBox(width: 4),
                          Expanded(
                              child: Text(
                                  viewModel.purchasedHistoryDetailState.address,
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.black)))
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(children: [
                        const Icon(Icons.calendar_today,
                            color: ColorSystem.primary, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          viewModel.purchasedHistoryDetailState.duration,
                          style: const TextStyle(fontSize: 10),
                        )
                      ]),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.phone,
                              color: ColorSystem.primary, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            StringUtil.getFormattedPhoneNumber(viewModel
                                .purchasedHistoryDetailState.cellPhoneNumber),
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
