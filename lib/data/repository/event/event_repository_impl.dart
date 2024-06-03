import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/event/popular_event_state.dart';
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
  Future<Map<String, dynamic>> getRecommendEventList() async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.getRecommendEventList();
    } catch (e) {
      rethrow;
    }

    return result;
  }
}
