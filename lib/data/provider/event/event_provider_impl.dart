import 'package:get/get.dart';
import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/app/type/e_event_status.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
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

  @override
  Future<Map<String, dynamic>> getEventList(
      {required EEventStatus status,
      required int page,
      required int size,
      EEventCategory? category}) async {
    final Response response;

    LogUtil.info("category: ${category?.enName}");

    try {
      response = await get("/api/events", query: {
        "status": status.toString(),
        "page": page.toString(),
        "size": size.toString(),
        "filter": category?.enName
      });
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }
}
