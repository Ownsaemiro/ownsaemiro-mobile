import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ownsaemiro/presentation/view_model/event/review_list_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

class ReviewListScreen extends BaseScreen<ReviewListViewModel> {
  const ReviewListScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: DefaultBackAppBar(title: "후기 전체보기"),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    viewModel.scrollController.addListener(() {
      if (viewModel.scrollController.position.pixels ==
              viewModel.scrollController.position.maxScrollExtent &&
          !viewModel.isLoading) {
        viewModel.fetchReviews();
      }
    });

    return Column(
      children: [
        const SizedBox(height: 24),
        Expanded(
          child: Obx(
            () {
              if (viewModel.isLoading && viewModel.reviews.isEmpty) {
                return ListView.builder(
                  controller: viewModel.scrollController,
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 16, right: 16),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.grey[300]!,
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    width: 40,
                                    height: 10,
                                    color: Colors.grey[300]!,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Center(
                                  child: Container(
                                    height: 10,
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              if (viewModel.reviews.isEmpty) {
                return const Center(
                  child: Text("후기가 없습니다."),
                );
              }

              return ListView.builder(
                controller: viewModel.scrollController,
                shrinkWrap: true,
                itemCount: viewModel.reviews.length + 1,
                itemBuilder: (context, index) {
                  if (index == viewModel.reviews.length) {
                    return viewModel.isLoading
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(
                              child: CircularProgressIndicator(
                                  color: ColorSystem.primary),
                            ),
                          )
                        : const SizedBox.shrink();
                  }

                  final review = viewModel.reviews[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    child: Container(
                      padding: const EdgeInsets.all(8),
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
                                backgroundImage: NetworkImage(review.image),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                review.name,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Center(
                              child: Text(
                                review.content,
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
            },
          ),
        ),
      ],
    );
  }
}
