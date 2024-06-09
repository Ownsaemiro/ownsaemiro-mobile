import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/database/local_database.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/data/model/event/search_event_state.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';
import 'package:ownsaemiro/domain/repository/recent_search_repository.dart';
import 'package:ownsaemiro/domain/usecase/add_recent_search_usecase.dart';
import 'package:ownsaemiro/domain/usecase/delete_recent_search_usecase.dart';
import 'package:ownsaemiro/domain/usecase/get_recent_searches_usecase.dart';

class SearchViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final EventRepository _eventRepository;
  late final RecentSearchRepository _recentSearchRepository;
  late final AddRecentSearchUseCase _addRecentSearchUseCase;
  late final DeleteRecentSearchUseCase _deleteRecentSearchUseCase;
  late final GetRecentSearchesUseCase _getRecentSearchesUseCase;
  late final TextEditingController _textController;
  late final ScrollController _scrollController;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<RecentSearchData> _recentSearches;
  late final RxList<SearchEventState> _searchEvents;
  final RxBool _isLoading = false.obs;
  final RxBool _isSearching = false.obs;
  final RxBool _isLoadingMore = false.obs;
  Timer? _debounce;

  int _page = 1;
  bool _hasMore = true;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<SearchEventState> get searchEvents => _searchEvents;

  TextEditingController get textController => _textController;

  ScrollController get scrollController => _scrollController;

  bool get isLoading => _isLoading.value;

  bool get isLoadingMore => _isLoadingMore.value;

  List<RecentSearchData> get recentSearches => _recentSearches;

  bool get isSearching => _isSearching.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency injection
    _eventRepository = Get.find<EventRepository>();
    _recentSearchRepository = Get.find<RecentSearchRepository>();
    _scrollController = ScrollController();

    // Initialize State
    _searchEvents = <SearchEventState>[].obs;
    _recentSearches = <RecentSearchData>[].obs;
    _textController = TextEditingController();
    _addRecentSearchUseCase = AddRecentSearchUseCase(_recentSearchRepository);
    _deleteRecentSearchUseCase =
        DeleteRecentSearchUseCase(_recentSearchRepository);
    _getRecentSearchesUseCase =
        GetRecentSearchesUseCase(_recentSearchRepository);
  }

  @override
  void onReady() async {
    super.onReady();

    loadRecentSearches();
  }

  void onTextChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        search(query);
      }
    });
  }

  void loadRecentSearches() async {
    List<RecentSearchData> data = await _getRecentSearchesUseCase.execute();
    _recentSearches.assignAll(data);
    update();
  }

  void addSearch(String keyword) async {
    await _addRecentSearchUseCase.execute(keyword);
    loadRecentSearches();
  }

  void deleteSearch(int id) async {
    await _deleteRecentSearchUseCase.execute(id);
    loadRecentSearches();
  }

  void search(String query) async {
    _isSearching.value = true;
    _isLoading.value = true;

    _searchEvents.clear();

    await _eventRepository
        .searchEvent(keyword: query, page: 1, size: 6)
        .then((value) {
      _searchEvents.addAll(value);
    });

    _isLoading.value = false;

    addSearch(query);
  }

  void loadMore() async {
    if (_isLoadingMore.value || !_hasMore) return;

    _isLoadingMore.value = true;
    _page++;

    await _eventRepository
        .searchEvent(keyword: _textController.text, page: _page, size: 6)
        .then(
      (value) {
        _searchEvents.addAll(value);
      },
    );

    _isLoadingMore.value = false;
  }

  void recentSearchAllDelete() async {
    for (var search in _recentSearches) {
      await _deleteRecentSearchUseCase.execute(search.id);
    }
    loadRecentSearches();
  }

  void clear() {
    _isSearching.value = false;
    _searchEvents.clear();
    _textController.clear();
  }
}
