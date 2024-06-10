import 'package:get/get.dart';
import 'package:ownsaemiro/data/provider/base/base_connect.dart';
import 'package:ownsaemiro/data/provider/notification/notification_provider.dart';

class NotificationProviderImpl extends BaseConnect
    implements NotificationProvider {
  @override
  Future<Map<String, dynamic>> deleteNotification({required int id}) async {
    final Response response;

    try {
      response = await delete("/api/users/notifications/$id");
    } catch (e) {
      rethrow;
    }

    return response.body;
  }

  @override
  Future<Map<String, dynamic>> getNotificationList(
      {required int page, required int size}) async {
    final Response response;

    try {
      response = await get("/api/users/notifications", query: {
        "page": page.toString(),
        "size": size.toString(),
      });
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }
}
