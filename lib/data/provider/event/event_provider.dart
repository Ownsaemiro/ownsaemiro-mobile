import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/app/type/e_event_status.dart';

abstract class EventProvider {
  Future<Map<String, dynamic>> getPopularEventList();

  Future<Map<String, dynamic>> getRecommendEventList();

  Future<Map<String, dynamic>> getEventList(
      {required int page, required int size, EEventCategory? category});

  Future<Map<String, dynamic>> getEventDetailInfo({required int eventId});

  Future<Map<String, dynamic>> getEventDetailBrief({required int eventId});

  Future<Map<String, dynamic>> getEventReviews({required int eventId});

  Future<Map<String, dynamic>> getEventSellerInfo({required int eventId});

  Future<Map<String, dynamic>> eventLike({required int eventId});

  Future<Map<String, dynamic>> eventUnlike({required int eventId});

  Future<Map<String, dynamic>> searchEvent(
      {required String keyword, required int page, required int size});

  Future<Map<String, dynamic>> getEventRemainSeats({required int eventId});

  Future<void> purchaseEventTicket(
      {required int eventId, required String date});

  Future<Map<String, dynamic>> getEventReviewList(
      {required int eventId, required int page, required int size});
}
