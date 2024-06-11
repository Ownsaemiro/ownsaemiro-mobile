import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view/event/widget/event_detail_bottom_widget.dart';
import 'package:ownsaemiro/presentation/view/event/widget/event_detail_top_widget.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_detail_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

class EventDetailScreen extends GetView<EventDetailViewModel> {
  EventDetailScreen({super.key});

  final int id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.setEventDetailInfoState(id);

    return Obx(() {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child:
              DefaultBackAppBar(title: controller.eventDetailInfoState.title),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: EventDetailTopWidget(id: id),
            )
          ],
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  labelColor: ColorSystem.primary,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: ColorSystem.primary,
                  indicator: UnderlineTabIndicator(
                    borderSide:
                        const BorderSide(width: 2, color: ColorSystem.primary),
                    insets: EdgeInsets.symmetric(
                      horizontal: (Get.width / 3.32),
                    ),
                  ),
                  tabs: const [
                    Tab(text: "공연 정보"),
                    Tab(text: "판매 정보"),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      _PerformanceInfoTab(),
                      _SellerInfoTab(),
                    ],
                  ),
                ),
                const EventDetailBottomWidget(),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _PerformanceInfoTab extends BaseWidget<EventDetailViewModel> {
  const _PerformanceInfoTab({super.key});

  @override
  Widget buildView(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Obx(
          () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "공연 내용 요약",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  viewModel.eventDetailBriefState.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 32),
                const _EventDetailReviewWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SellerInfoTab extends BaseWidget<EventDetailViewModel> {
  const _SellerInfoTab({super.key});

  @override
  Widget buildView(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
              },
              border: TableBorder.symmetric(
                inside: BorderSide(color: Colors.grey.shade300, width: 0.5),
              ),
              children: [
                TableRow(
                  children: [
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          '주최/기획',
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(viewModel.eventSellerInfoState.director,
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('공연시간',
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(viewModel.eventSellerInfoState.durationTime,
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('관람등급',
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(viewModel.eventSellerInfoState.rating,
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('공연장소',
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(viewModel.eventSellerInfoState.address,
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _EventDetailReviewWidget extends BaseWidget<EventDetailViewModel> {
  const _EventDetailReviewWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "공연 후기",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.REVIEW_LIST);
              },
              child: const Text(
                "후기 전체보기",
                style: TextStyle(
                  fontSize: 12,
                  color: ColorSystem.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Obx(() {
          if (viewModel.eventReviewState.isEmpty) {
            return const Center(
              child: Text("후기가 없습니다."),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: viewModel.eventReviewState.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(
                              viewModel.eventReviewState[index].profileImage,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            viewModel.eventReviewState[index].nickname,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Center(
                          child: Text(
                            viewModel.eventReviewState[index].content,
                            style: const TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        })
      ],
    );
  }
}
