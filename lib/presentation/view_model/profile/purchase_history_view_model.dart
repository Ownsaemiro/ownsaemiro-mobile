import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/profile/purchased_history_state.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository.dart';

class PurchaseHistoryViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ProfileRepository _profileRepository;
  late final ScrollController _scrollController;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<PurchasedHistoryState> _purchasedHistoryList;
  final RxBool _isLoading = false.obs;
  final RxBool _isLoadingMore = false.obs;

  int _page = 1;
  bool _hasMore = true;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<PurchasedHistoryState> get purchasedHistoryList => _purchasedHistoryList;

  bool get isLoadingMore => _isLoadingMore.value;

  ScrollController get scrollController => _scrollController;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _profileRepository = Get.find<ProfileRepository>();

    // Initialize State
    _purchasedHistoryList = <PurchasedHistoryState>[].obs;
    _scrollController = ScrollController();
  }

  @override
  void onReady() async {
    super.onReady();

    await _fetchData();
  }

  Future<void> _fetchData() async {
    if (_isLoading.value) return;

    _isLoading.value = true;

    try {
      final newEvents =
          await _profileRepository.getPurchasedList(page: _page, size: 8);

      if (newEvents.isNotEmpty) {
        _purchasedHistoryList.addAll(newEvents);
        _page += 2;
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> fetchMoreData() async {
    if (_isLoadingMore.value || !_hasMore) return;

    _isLoadingMore.value = true;

    try {
      final newEvents =
          await _profileRepository.getPurchasedList(page: _page, size: 4);

      if (newEvents.isNotEmpty) {
        _purchasedHistoryList.addAll(newEvents);
        _page++;
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoadingMore.value = false;
    }
  }

  void setPurchasedHistoryList() async {
    _isLoading.value = true;
    _page = 1;
    _hasMore = true;

    _purchasedHistoryList.clear();

    await _profileRepository.getPurchasedList(page: 1, size: 8).then((value) {
      _purchasedHistoryList.addAll(value);
    });

    _isLoading.value = false;
  }
}
