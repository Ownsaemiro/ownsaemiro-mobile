import 'package:get/get.dart';
import 'package:ownsaemiro/data/provider/base/base_connect.dart';
import 'package:ownsaemiro/data/provider/event/event_provider.dart';

class EventProviderImpl extends BaseConnect implements EventProvider {
  @override
  Future<Map<String, dynamic>> getPopularEventList() async {
    final Response response;

    try {
      response = await get(
        "/api/events/popular",
      );
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }

  @override
  Future<Map<String, dynamic>> getRecommendEventList() async {
    final Response response;

    try {
      response = await get("/api/events/recommends");
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }
}
