import 'package:ownsaemiro/data/model/event/popular_event_state.dart';
import 'package:ownsaemiro/data/model/event/recommend_event_state.dart';

abstract class EventRepository {
  Future<List<PopularEventState>> getPopularEventList();

  Future<List<RecommendEventState>> getRecommendEventList();
}
