import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'log_util.dart';

abstract class NotificationUtil {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static bool isFlutterLocalNotificationsInitialized = false;

  static const AndroidNotificationDetails
      _androidPlatformRemoteChannelSpecifics = AndroidNotificationDetails(
    'ownsaemiro_remote_channel_id',
    '온세미로',
    channelDescription: 'Ownsaemiro Channel',
    importance: Importance.high,
    priority: Priority.high,
    showWhen: false,
  );

  static const NotificationDetails _platformRemoteChannelSpecifics =
      NotificationDetails(
    android: _androidPlatformRemoteChannelSpecifics,
    iOS: DarwinNotificationDetails(
      badgeNumber: 1,
    ),
  );

  static Future<void> initialize() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('mipmap/ownsaemiro');

    DarwinInitializationSettings initializationSettingsIOS =
        const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _plugin.initialize(initializationSettings);
  }

  static Future<void> setupRemoteNotification() async {
    if (isFlutterLocalNotificationsInitialized) return;

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'ownsaemiro_remote_channel_id',
      '온세미로',
      description: 'Ownsaemiro Remote Channel',
      importance: Importance.high,
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // iOS foreground notification 권한
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // IOS background 권한 체킹 , 요청
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // 셋팅flag 설정
    isFlutterLocalNotificationsInitialized = true;
  }

  @pragma('vm:entry-point')
  static Future<void> onBackgroundHandler(
    RemoteMessage message,
  ) async {
    LogUtil.debug('onBackgroundHandler');
  }

  static void onForegroundHandler(
    RemoteMessage message,
  ) async {
    LogUtil.debug('onForegroundHandler');

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      _plugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        _platformRemoteChannelSpecifics,
      );
    }
  }
}
