import 'package:ownsaemiro/data/model/event/popular_event_state.dart';

abstract class EventRepository {
  Future<List<PopularEventState>> getPopularEventList();

  Future<Map<String, dynamic>> getRecommendEventList();
}
