import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/event/search_event_state.dart';
import 'package:ownsaemiro/domain/repository/recent_search_repository.dart';

class SearchViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final RecentSearchRepository _recentSearchRepository;
  late final TextEditingController _textController;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<SearchEventState> _searchEvents;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<SearchEventState> get searchEvents => _searchEvents;

  TextEditingController get textController => _textController;

  var isSearching = false.obs;
  var searchResults = <String>[].obs;
  var popularSearches = ['뉴진스', '민지', '해린', '하니', '다니엘', '혜인'].obs;

  @override
  void onInit() {
    super.onInit();

    // Dependency injection
    _recentSearchRepository = Get.find<RecentSearchRepository>();

    // Initialize State
    _searchEvents = <SearchEventState>[].obs;
    _textController = TextEditingController();
  }

  void search(String query) {
    isSearching.value = true;

    _recentSearchRepository.addSearch(query);

    searchResults.value =
        popularSearches.where((element) => element.contains(query)).toList();
  }

  void clear() {
    isSearching.value = false;
    searchResults.value = [];
    _textController.clear();
  }

  void deleteSearch(int id) {
    _recentSearchRepository.deleteSearch(id);
  }
}
