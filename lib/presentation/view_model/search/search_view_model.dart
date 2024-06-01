import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchViewModel extends GetxController {
  var isSearching = false.obs;
  var searchResults = <String>[].obs;
  var popularSearches = ['뉴진스', '민지', '해린', '하니', '다니엘', '혜인'].obs;

  TextEditingController searchController = TextEditingController();

  void search(String query) {
    isSearching.value = true;
    searchResults.value =
        popularSearches.where((element) => element.contains(query)).toList();
  }

  void clear() {
    isSearching.value = false;
    searchResults.value = [];
    searchController.clear();
  }
}
