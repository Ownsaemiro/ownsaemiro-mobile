import 'package:get/get.dart';
import 'package:ownsaemiro/data/provider/base/base_connect.dart';
import 'package:ownsaemiro/data/provider/event/event_provider.dart';

class EventProviderImpl extends BaseConnect implements EventProvider {
  @override
  Future<Map<String, dynamic>> getTopFiveEventList() async {
    final Response response;

    try {
      response = await get(
        "/api/event/top-five",
      );
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }
}
