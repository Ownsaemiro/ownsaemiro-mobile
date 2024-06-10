import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/event/review_state.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_detail_view_model.dart';

class ReviewListViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final EventDetailViewModel _eventDetailViewModel;
  late final EventRepository _eventRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  final RxInt _eventId = 0.obs;
  final RxList<ReviewState> _reviews = <ReviewState>[].obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isLoadMore = false.obs;
  late final ScrollController _scrollController;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  int get eventId => _eventId.value;

  List<ReviewState> get reviews => _reviews;

  bool get isLoading => _isLoading.value;

  bool get isLoadMore => _isLoadMore.value;

  ScrollController get scrollController => _scrollController;

  int _currentPage = 1;
  bool _hasMore = true;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _eventDetailViewModel = Get.find<EventDetailViewModel>();
    _eventRepository = Get.find<EventRepository>();
    _scrollController = ScrollController();

    // Initialize State
    _eventId.value = _eventDetailViewModel.eventDetailInfoState.id;
  }

  @override
  void onReady() async {
    super.onReady();

    await fetchReview();
  }

  Future<void> fetchReview() async {
    if (_isLoading.value) return;

    _isLoading.value = true;

    try {
      final data = await _eventRepository.getEventReviewList(
        eventId: eventId,
        page: 1,
        size: 9,
      );

      if (data.isNotEmpty) {
        _reviews.addAll(data);
        _currentPage += 3;
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> fetchReviewMore() async {
    if (_isLoadMore.value || !_hasMore) return;

    _isLoadMore.value = true;

    try {
      final data = await _eventRepository.getEventReviewList(
        eventId: eventId,
        page: _currentPage,
        size: 3,
      );

      if (data.isNotEmpty) {
        _reviews.addAll(data);
        _currentPage++;
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoadMore.value = false;
    }
  }
}
