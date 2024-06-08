import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/data/model/market/ticket_state.dart';
import 'package:ownsaemiro/data/repository/market/market_repository.dart';

class MarketViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final MarketRepository _marketRepository;
  late final ScrollController _scrollController;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<TicketState> _ticketList;
  late final Rx<EEventCategory> _eventCategory;
  final RxBool _isStateLoading = false.obs;
  final RxBool _isLoadingMore = false.obs;

  int _page = 1;
  bool _hasMore = true;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<TicketState> get ticketList => _ticketList;

  bool get isStateLoading => _isStateLoading.value;

  bool get isLoadingMore => _isLoadingMore.value;

  ScrollController get scrollController => _scrollController;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _marketRepository = Get.find<MarketRepository>();
    _scrollController = ScrollController();

    // Initialize State
    _eventCategory = EEventCategory.all.obs;
    _ticketList = <TicketState>[].obs;
  }

  @override
  void onReady() async {
    super.onReady();
    await _fetchTickets();
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
    _ticketList.clear();
    _page = 1;
    _hasMore = true;

    await _fetchTickets();
  }

  Future<void> _fetchTickets() async {
    if (_isStateLoading.value) return;
    _isStateLoading.value = true;

    try {
      final newTickets = await _marketRepository.getTicketList(
        page: _page,
        size: 8,
        filter: _eventCategory.value,
      );

      if (newTickets.isNotEmpty) {
        _ticketList.addAll(newTickets);
        _page++;
      } else {
        _hasMore = false;
      }
    } finally {
      _isStateLoading.value = false;
    }
  }

  Future<void> fetchMoreTickets() async {
    if (_isLoadingMore.value || !_hasMore) return;
    _isLoadingMore.value = true;

    try {
      final newTickets = await _marketRepository.getTicketList(
        page: _page,
        size: 3,
        filter: _eventCategory.value,
      );

      if (newTickets.isNotEmpty) {
        _ticketList.addAll(newTickets);
        _page++;
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoadingMore.value = false;
    }
  }
}
