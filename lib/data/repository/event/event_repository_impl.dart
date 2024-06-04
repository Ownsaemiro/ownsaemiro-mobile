import 'package:get/get.dart';
import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/app/type/e_event_status.dart';
import 'package:ownsaemiro/data/model/event/before_event_state.dart';
import 'package:ownsaemiro/data/model/event/during_event_state.dart';
import 'package:ownsaemiro/data/model/event/popular_event_state.dart';
import 'package:ownsaemiro/data/model/event/recommend_event_state.dart';
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
}
