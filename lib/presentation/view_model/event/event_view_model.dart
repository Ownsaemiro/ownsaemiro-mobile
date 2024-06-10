import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/data/model/event/search_event_state.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';

class EventViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final EventRepository _eventRepository;
  late final ScrollController _scrollController;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<SearchEventState> _state;
  late final Rx<EEventCategory> _eventCategory;

  late final RxBool _isLoading = false.obs;
  late final RxBool _isLoadingMore = false.obs;

  int _page = 1;

  bool _hasMore = true;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */

  ScrollController get scrollController => _scrollController;

  List<SearchEventState> get state => _state;

  bool get isLoading => _isLoading.value;

  bool get isLoadingMore => _isLoadingMore.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _eventRepository = Get.find<EventRepository>();
    _scrollController = ScrollController();

    // Initialize State
    _state = <SearchEventState>[].obs;
    _eventCategory = EEventCategory.all.obs;
  }

  @override
  void onReady() async {
    super.onReady();
    selectCategory(0);
  }

  final RxInt selectedIndex = 0.obs;

  final List<String> chipList = [
    "전체",
    "뮤지컬",
    "전시",
    "연극",
    "콘서트",
    "스포츠",
  ];

  void selectCategory(int index) async {
    selectedIndex.value = index;
    String category = chipList[index];

    _eventCategory.value = EEventCategory.fromKoName(category);

    _state.clear();

    _page = 1;

    _hasMore = true;

    await _loadData();
  }

  Future<void> _loadData() async {
    if (_isLoading.value) return;

    _isLoading.value = true;

    try {
      final data = await _eventRepository.getEventList(
          page: _page, size: 9, category: _eventCategory.value);

      if (data.isNotEmpty) {
        _state.addAll(data);
        _page += 3;
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> loadMoreData() async {
    if (_isLoadingMore.value || !_hasMore) return;

    _isLoadingMore.value = true;

    try {
      final data = await _eventRepository.getEventList(
          page: _page, size: 3, category: _eventCategory.value);

      if (data.isNotEmpty) {
        _state.addAll(data);
        _page++;
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoadingMore.value = false;
    }
  }
}
