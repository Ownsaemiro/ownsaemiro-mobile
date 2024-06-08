import 'package:get/get.dart';
import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/app/type/e_event_status.dart';
import 'package:ownsaemiro/data/model/event/before_event_state.dart';
import 'package:ownsaemiro/data/model/event/during_event_state.dart';
import 'package:ownsaemiro/data/model/event/event_detail_brief_state.dart';
import 'package:ownsaemiro/data/model/event/event_detail_info_state.dart';
import 'package:ownsaemiro/data/model/event/event_review_state.dart';
import 'package:ownsaemiro/data/model/event/event_seller_info_state.dart';
import 'package:ownsaemiro/data/model/event/popular_event_state.dart';
import 'package:ownsaemiro/data/model/event/recommend_event_state.dart';
import 'package:ownsaemiro/data/model/event/search_event_state.dart';
import 'package:ownsaemiro/data/provider/event/event_provider.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';

class EventRepositoryImpl extends GetxService implements EventRepository {
  late final EventProvider _eventProvider;

  @override
  void onInit() {
    super.onInit();
    _eventProvider = Get.find<EventProvider>();
  }

  @override
  Future<List<PopularEventState>> getPopularEventList() async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.getPopularEventList();
    } catch (e) {
      rethrow;
    }

    return result["events"]
        .map<PopularEventState>((event) => PopularEventState.fromJson(event))
        .toList();
  }

  @override
  Future<List<RecommendEventState>> getRecommendEventList() async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.getRecommendEventList();
    } catch (e) {
      rethrow;
    }

    return result["events"]
        .map<RecommendEventState>(
            (event) => RecommendEventState.fromJson(event))
        .toList();
  }

  @override
  Future<List<BeforeEventState>> getBeforeEventList(
      {required int page, required int size, EEventCategory? category}) async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.getEventList(
          status: EEventStatus.before,
          page: page,
          size: size,
          category: category);
    } catch (e) {
      rethrow;
    }

    return result["events"]
        .map<BeforeEventState>((event) => BeforeEventState.fromJson(event))
        .toList();
  }

  @override
  Future<List<DuringEventState>> getDuringEventList(
      {required int page, required int size, EEventCategory? category}) async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.getEventList(
          status: EEventStatus.selling,
          page: page,
          size: size,
          category: category);
    } catch (e) {
      rethrow;
    }

    return result["events"]
        .map<DuringEventState>((event) => DuringEventState.fromJson(event))
        .toList();
  }

  @override
  Future<EventDetailInfoState> getEventDetailInfo(
      {required int eventId}) async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.getEventDetailInfo(eventId: eventId);
    } catch (e) {
      rethrow;
    }

    return EventDetailInfoState.fromJson(result);
  }

  @override
  Future<EventDetailBriefState> getEventDetailBrief(
      {required int eventId}) async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.getEventDetailBrief(eventId: eventId);
    } catch (e) {
      rethrow;
    }

    return EventDetailBriefState.fromJson(result);
  }

  @override
  Future<List<EventReviewState>> getEventReviews({required int eventId}) async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.getEventReviews(eventId: eventId);
    } catch (e) {
      rethrow;
    }

    return result["reviews"]
        .map<EventReviewState>((review) => EventReviewState.fromJson(review))
        .toList();
  }

  @override
  Future<EventSellerInfoState> getEventSellerInfo(
      {required int eventId}) async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.getEventSellerInfo(eventId: eventId);
    } catch (e) {
      rethrow;
    }

    return EventSellerInfoState.fromJson(result);
  }

  @override
  Future<void> eventLike({required int eventId}) async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.eventLike(eventId: eventId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> eventUnlike({required int eventId}) async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.eventUnlike(eventId: eventId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SearchEventState>> searchEvent(
      {required String keyword, required int page, required int size}) async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.searchEvent(
          keyword: keyword, page: page, size: size);
    } catch (e) {
      rethrow;
    }

    return result["events"]
        .map<SearchEventState>((event) => SearchEventState.fromJson(event))
        .toList();
  }

  @override
  Future<int> getEventRemainSeats({required int eventId}) async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.getEventRemainSeats(eventId: eventId);
    } catch (e) {
      rethrow;
    }

    return result["remaining_seat"];
  }

  @override
  Future<void> purchaseEventTicket(
      {required int eventId, required String date}) async {
    try {
      await _eventProvider.purchaseEventTicket(eventId: eventId, date: date);
    } catch (e) {
      rethrow;
    }
  }
}
