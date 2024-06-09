import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
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
  late final ScrollController _scrollController;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  int get eventId => _eventId.value;

  List<ReviewState> get reviews => _reviews;

  bool get isLoading => _isLoading.value;

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
    fetchReviews();
  }

  Future<void> fetchReviews({bool isRefresh = false}) async {
    if (_isLoading.value) return;
    _isLoading.value = true;

    if (isRefresh) {
      _currentPage = 1;
      _hasMore = true;
      _reviews.clear();
    }

    try {
      final newReviews = await _eventRepository.getEventReviewList(
        eventId: eventId,
        page: _currentPage,
        size: 10,
      );

      if (newReviews.isNotEmpty) {
        _reviews.addAll(newReviews);
        _currentPage++;
      } else {
        _hasMore = false;
      }
    } catch (e) {
      LogUtil.error(e.toString());
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> refreshReviews() async {
    await fetchReviews(isRefresh: true);
  }
}
