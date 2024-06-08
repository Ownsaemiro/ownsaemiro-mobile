import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/profile/user_liked_event_state.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository.dart';

class LikedEventViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ProfileRepository _profileRepository;
  late final EventRepository _eventRepository;
  late final ScrollController _scrollController;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<UserLikedEventState> _userLikedEventState;
  late final RxBool _isLoaded = false.obs;
  late final RxBool _isLoadingMore = false.obs;

  int _page = 1;
  bool _hasMore = true;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<UserLikedEventState> get userLikedEventState => _userLikedEventState;

  bool get isLoaded => _isLoaded.value;

  bool get isLoadingMore => _isLoadingMore.value;

  ScrollController get scrollController => _scrollController;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _profileRepository = Get.find<ProfileRepository>();
    _eventRepository = Get.find<EventRepository>();
    _scrollController = ScrollController();

    // Initialize State
    _userLikedEventState = <UserLikedEventState>[].obs;
  }

  @override
  void onReady() async {
    super.onReady();

    await _fetchLikedEvents();
  }

  Future<void> _fetchLikedEvents() async {
    if (_isLoaded.value) return;
    _isLoaded.value = true;

    try {
      final newEvents =
          await _profileRepository.getUserLikedEvent(page: _page, size: 8);

      if (newEvents.isNotEmpty) {
        _userLikedEventState.addAll(newEvents);
        _page++;
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoaded.value = false;
    }
  }

  Future<void> fetchMoreLikedEvents() async {
    if (_isLoadingMore.value || !_hasMore) return;
    _isLoadingMore.value = true;

    try {
      final newEvents =
          await _profileRepository.getUserLikedEvent(page: _page, size: 3);

      if (newEvents.isNotEmpty) {
        _userLikedEventState.addAll(newEvents);
        _page++;
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoadingMore.value = false;
    }
  }

  void unlikeEvent(int eventId) {
    UserLikedEventState event =
        _userLikedEventState.firstWhere((event) => event.id == eventId);

    // Check is_liked is true
    if (!event.isLiked) return;

    // Call API to Unlike Event
    _eventRepository.eventUnlike(eventId: eventId);

    // Remove Event from State
    _userLikedEventState.removeWhere((event) => event.id == eventId);
  }
}
