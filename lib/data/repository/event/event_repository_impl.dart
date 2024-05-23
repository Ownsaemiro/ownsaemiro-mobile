import 'package:get/get.dart';
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
  Future<Map<String, dynamic>> getTopEventList() async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.getTopEventList();
    } catch (e) {
      rethrow;
    }

    return {
      "image": result["image"],
      "title": result["title"],
      "date": result["date"]
    };
  }

  @override
  Future<Map<String, dynamic>> getRecommendEventList() async {
    Map<String, dynamic> result;

    try {
      result = await _eventProvider.getRecommendEventList();
    } catch (e) {
      rethrow;
    }

    return {
      "image": result["image"],
      "title": result["title"],
      "date": result["date"]
    };
  }
}
