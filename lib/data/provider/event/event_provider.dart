import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/app/type/e_event_status.dart';

abstract class EventProvider {
  Future<Map<String, dynamic>> getPopularEventList();

  Future<Map<String, dynamic>> getRecommendEventList();

  Future<Map<String, dynamic>> getEventList(
      {required EEventStatus status,
      required int page,
      required int size,
      EEventCategory? category});
}
