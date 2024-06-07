import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/search/search_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

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
    return Column(children: [
      Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: viewModel.textController,
            decoration: InputDecoration(
              hintText: '검색어를 입력해주세요',
              hintStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey), // 테두리 선을 회색으로 설정
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey), // 비활성화 상태의 테두리 색상
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey), // 포커스 상태의 테두리 색상
              ),
              filled: false,
              suffixIcon: Obx(() {
                if (viewModel.isSearching.value) {
                  return IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: viewModel.clear,
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ),
            onSubmitted: viewModel.search,
          )),
      Expanded(child: Obx(() {
        return viewModel.isSearching.value
            ? const _SearchResultWidget()
            : const Column(
                children: [
                  _SearchWidget(),
                  _RecentSearchWidget(),
                ],
              );
      }))
    ]);
  }
}

class _SearchWidget extends BaseWidget<SearchViewModel> {
  const _SearchWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            '인기 검색',
            style: FontSystem.KR18B,
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 8,
              children: viewModel.popularSearches.map((search) {
                return ActionChip(
                  label: Text(search),
                  labelStyle: FontSystem.KR14N,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    // Handle the tap event
                    viewModel.search(search);
                    viewModel.textController.text = search;
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 28),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '최근 검색',
                style: FontSystem.KR18B,
              ),
              Text('전체 삭제', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ]));
  }
}

class _RecentSearchWidget extends BaseWidget<SearchViewModel> {
  const _RecentSearchWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Column(
      children: viewModel.popularSearches.map((search) {
        return ListTile(
          leading: const Icon(Icons.history, color: Colors.grey),
          title: Text(search),
          trailing: const Icon(Icons.close, color: Colors.grey),
          onTap: () {
            viewModel.search(search);
            viewModel.textController.text = search;
          },
        );
      }).toList(),
    );
  }
}

class _SearchResultWidget extends BaseWidget<SearchViewModel> {
  const _SearchResultWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.55,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: viewModel.searchResults.length,
        itemBuilder: (context, index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                // Get.to(() => const EventDetailScreen());
              },
              child: const Center(),
            ),
          );
        });
  }
}
