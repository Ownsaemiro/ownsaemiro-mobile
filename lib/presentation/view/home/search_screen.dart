import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view/home/widget/home/search_event_item_widget.dart';
import 'package:ownsaemiro/presentation/view_model/search/search_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends BaseScreen<SearchViewModel> {
  const SearchScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: DefaultBackAppBar(title: "행사 검색"),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: viewModel.textController,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: '검색어를 입력해주세요',
              hintStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              filled: false,
              suffixIcon: Obx(
                () {
                  if (viewModel.isSearching) {
                    return IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: viewModel.clear,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            onChanged: viewModel.onTextChanged,
          ),
        ),
        Expanded(
          child: Obx(
            () {
              return viewModel.isSearching
                  ? const _SearchResultWidget()
                  : const Column(
                      children: [
                        _SearchWidget(),
                        _RecentSearchWidget(),
                      ],
                    );
            },
          ),
        )
      ],
    );
  }
}

class _SearchWidget extends BaseWidget<SearchViewModel> {
  const _SearchWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '최근 검색',
                style: FontSystem.KR18B,
              ),
              GestureDetector(
                onTap: () {
                  viewModel.recentSearchAllDelete();
                },
                child:
                    const Text('전체 삭제', style: TextStyle(color: Colors.grey)),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _RecentSearchWidget extends BaseWidget<SearchViewModel> {
  const _RecentSearchWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(() {
      return Column(
        children: viewModel.recentSearches.map((search) {
          return ListTile(
            leading: const Icon(Icons.history, color: Colors.grey),
            title: Text(search.keyword),
            trailing: GestureDetector(
              onTap: () {
                viewModel.deleteSearch(search.id);
              },
              child: const Icon(Icons.close, color: Colors.grey),
            ),
            onTap: () {
              viewModel.search(search.keyword);
              viewModel.textController.text = search.keyword;
            },
          );
        }).toList(),
      );
    });
  }
}

class _SearchResultWidget extends BaseWidget<SearchViewModel> {
  const _SearchResultWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    viewModel.scrollController.addListener(
      () {
        if (viewModel.scrollController.position.pixels ==
            viewModel.scrollController.position.maxScrollExtent) {
          viewModel.loadMore();
        }
      },
    );

    return Obx(
      () {
        if (viewModel.isLoading && viewModel.searchEvents.isEmpty) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.55,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              return const _SkeletonItem();
            },
          );
        }

        return GridView.builder(
          controller: viewModel.scrollController,
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.55,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount:
              viewModel.searchEvents.length + (viewModel.isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == viewModel.searchEvents.length) {
              return const _SkeletonItem();
            }

            if (viewModel.searchEvents.isEmpty) {
              return const Center(child: Text('검색 결과가 없습니다.'));
            }

            return Center(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.EVENT_DETAIL,
                      arguments: viewModel.searchEvents[index].eventId);
                },
                child: Center(
                  child: SearchEventItemWidget(
                      state: viewModel.searchEvents[index]),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _SkeletonItem extends StatelessWidget {
  const _SkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.25;
    final containerHeight = containerWidth * 1.4;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: containerWidth,
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: containerWidth,
            height: 20,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
