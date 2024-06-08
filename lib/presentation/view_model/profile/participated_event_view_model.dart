import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/profile/participated_event_state.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository.dart';

class ParticipatedEventViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ProfileRepository _profileRepository;
  late final ScrollController _scrollController;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<ParticipatedEventState> _state;
  late final TextEditingController _reviewController;
  final RxBool _isLoading = false.obs;
  final RxBool _isLoadingMore = false.obs;

  int _page = 1;
  bool _hasMore = true;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<ParticipatedEventState> get state => _state;

  bool get isLoading => _isLoading.value;

  bool get isLoadingMore => _isLoadingMore.value;

  TextEditingController get reviewController => _reviewController;

  ScrollController get scrollController => _scrollController;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _profileRepository = Get.find<ProfileRepository>();

    // Initialize State
    _state = <ParticipatedEventState>[].obs;
    _reviewController = TextEditingController();
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
      final newData = await _profileRepository.getParticipatedEvent(
        page: _page,
        size: 8,
      );

      if (newData.isNotEmpty) {
        _state.addAll(newData);
        _page++;
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> fetchMoreData() async {
    if (_isLoadingMore.value || !_hasMore) return Future.value();

    _isLoadingMore.value = true;

    try {
      final newData = await _profileRepository.getParticipatedEvent(
        page: _page,
        size: 3,
      );

      if (newData.isNotEmpty) {
        _state.addAll(newData);
        _page++;
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoadingMore.value = false;
    }
  }

  void sendReview(int id) async {
    await _profileRepository.sendReview(
        eventId: id, content: _reviewController.text);

    _reviewController.clear();
  }
}
