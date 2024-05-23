import 'package:get/get.dart';
import 'package:ownsaemiro/data/provider/base/base_connect.dart';
import 'package:ownsaemiro/data/provider/notification/notification_provider.dart';

class NotificationProviderImpl extends BaseConnect
    implements NotificationProvider {
  @override
  Future<Map<String, dynamic>> getNotificationList() async {
    final Response response;

    try {
      response = await get(
        "/api/notifications",
      );
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }
}
