abstract class NotificationProvider {
  Future<Map<String, dynamic>> getNotificationList(
      {required int page, required int size});

  Future<Map<String, dynamic>> deleteNotification({required int id});
}
