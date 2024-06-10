import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/data/model/event/before_event_state.dart';
import 'package:ownsaemiro/data/model/event/during_event_state.dart';
import 'package:ownsaemiro/data/model/event/event_detail_brief_state.dart';
import 'package:ownsaemiro/data/model/event/event_detail_info_state.dart';
import 'package:ownsaemiro/data/model/event/event_review_state.dart';
import 'package:ownsaemiro/data/model/event/event_seller_info_state.dart';
import 'package:ownsaemiro/data/model/event/popular_event_state.dart';
import 'package:ownsaemiro/data/model/event/recommend_event_state.dart';
import 'package:ownsaemiro/data/model/event/review_state.dart';
import 'package:ownsaemiro/data/model/event/search_event_state.dart';

abstract class EventRepository {
  Future<List<PopularEventState>> getPopularEventList();

  Future<List<RecommendEventState>> getRecommendEventList();

  Future<List<SearchEventState>> getEventList(
      {required int page, required int size, EEventCategory? category});

  Future<EventDetailInfoState> getEventDetailInfo({required int eventId});

  Future<EventDetailBriefState> getEventDetailBrief({required int eventId});

  Future<List<EventReviewState>> getEventReviews({required int eventId});

  Future<EventSellerInfoState> getEventSellerInfo({required int eventId});

  Future<void> eventLike({required int eventId});

  Future<void> eventUnlike({required int eventId});

  Future<List<SearchEventState>> searchEvent(
      {required String keyword, required int page, required int size});

  Future<int> getEventRemainSeats({required int eventId});

  Future<void> purchaseEventTicket(
      {required int eventId, required String date});

  Future<List<ReviewState>> getEventReviewList(
      {required int eventId, required int page, required int size});
}
