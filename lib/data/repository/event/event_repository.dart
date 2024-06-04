import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/data/model/event/before_event_state.dart';
import 'package:ownsaemiro/data/model/event/during_event_state.dart';
import 'package:ownsaemiro/data/model/event/popular_event_state.dart';
import 'package:ownsaemiro/data/model/event/recommend_event_state.dart';

abstract class EventRepository {
  Future<List<PopularEventState>> getPopularEventList();

  Future<List<RecommendEventState>> getRecommendEventList();

  Future<List<DuringEventState>> getDuringEventList(
      {required int page, required int size, EEventCategory? category});

  Future<List<BeforeEventState>> getBeforeEventList(
      {required int page, required int size, EEventCategory? category});
}
