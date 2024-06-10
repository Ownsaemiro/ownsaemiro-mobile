import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';

class FirebaseMiddleware {
  Future<void> initialize() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      LogUtil.info("User granted permission");
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      if (message != null) {
        if (message.notification != null) {
          LogUtil.info(
              "onMessage: ${message.notification!.title}: ${message.notification!.body}");
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
      if (message != null) {
        if (message.notification != null) {
          LogUtil.info(
              "onMessageOpenedApp: ${message.notification!.title}: ${message.notification!.body}");
        }
      }
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        if (message.notification != null) {
          LogUtil.info(
              "getInitialMessage: ${message.notification!.title}: ${message.notification!.body}");
        }
      }
    });
  }
}
