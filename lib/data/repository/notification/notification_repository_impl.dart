import 'package:get/get.dart';
import 'package:ownsaemiro/data/provider/notification/notification_provider.dart';
import 'package:ownsaemiro/data/repository/notification/notification_repository.dart';

class NotificationRepositoryImpl extends GetxService
    implements NotificationRepository {
  late final NotificationProvider _notificationProvider;

  @override
  onInit() {
    super.onInit();
    _notificationProvider = Get.find<NotificationProvider>();
  }

  @override
  Future<Map<String, dynamic>> getNotificationList() async {
    Map<String, dynamic> result;

    try {
      result = await _notificationProvider.getNotificationList();
    } catch (e) {
      rethrow;
    }

    return {"data": result["data"]};
  }
}
