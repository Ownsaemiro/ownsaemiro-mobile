import 'package:ownsaemiro/data/model/notification/notification_state.dart';

abstract class NotificationRepository {
  Future<List<NotificationState>> getNotificationList(
      {required int page, required int size});

  Future<void> deleteNotification({required int id});
}
