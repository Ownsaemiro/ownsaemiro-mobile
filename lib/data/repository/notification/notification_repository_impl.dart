import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/notification/notification_state.dart';
import 'package:ownsaemiro/data/provider/notification/notification_provider.dart';
import 'package:ownsaemiro/data/repository/notification/notification_repository.dart';

class NotificationRepositoryImpl extends GetxService
    implements NotificationRepository {
  late final NotificationProvider _notificationProvider;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _notificationProvider = Get.find<NotificationProvider>();
  }

  @override
  Future<void> deleteNotification({required int id}) async {
    try {
      await _notificationProvider.deleteNotification(id: id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<NotificationState>> getNotificationList(
      {required int page, required int size}) async {
    Map<String, dynamic> result;

    try {
      result = await _notificationProvider.getNotificationList(
          page: page, size: size);
    } catch (e) {
      rethrow;
    }

    return result["notifications"].map<NotificationState>((e) {
      return NotificationState.fromJson(e);
    }).toList();
  }
}
