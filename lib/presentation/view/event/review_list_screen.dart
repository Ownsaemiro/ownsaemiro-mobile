import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
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
    return Column(
      children: [
        const SizedBox(height: 32),
        Expanded(
          child: Obx(
            () {
              return ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: viewModel.reviews.length,
                itemBuilder: (context, index) {
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
                                backgroundColor: Colors.grey.shade300,
                                child: const Icon(Icons.person,
                                    color: Colors.grey),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "사용자 이름",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Center(
                              child: Text(
                                review,
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ElevatedButton(
            onPressed: viewModel.loadMoreReviews,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorSystem.primary,
              minimumSize: const Size(120, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              "더보기",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
