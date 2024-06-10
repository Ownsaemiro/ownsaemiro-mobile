import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:ownsaemiro/app/factory/firebase_factory.dart';
import 'package:ownsaemiro/app/main_app.dart';
import 'package:ownsaemiro/app/utility/notification_util.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:timezone/data/latest.dart' as tz;

import 'app/factory/local_database_factory.dart';
import 'app/factory/secure_storage_factory.dart';

void main() async {
  await onSystemInit();
  await onSystemReady();

  runApp(const MainApp());
}

Future<void> deleteDatabase() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, 'sqlite.db'));
  if (file.existsSync()) {
    await file.delete();
  }
}

Future<void> onSystemInit() async {
  // WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();

  // Date Format
  await initializeDateFormatting();
  tz.initializeTimeZones();

  // Dotenv
  await dotenv.load(fileName: "assets/configs/.env");

  // Kakao SDK
  KakaoSdk.init(
      nativeAppKey: "${dotenv.env["KAKAO_NATIVE_APP_KEY"]}",
      javaScriptAppKey: "${dotenv.env["KAKAO_JAVASCRIPT_APP_KEY"]}");

  // Firebase
  await Firebase.initializeApp(
    options: FirebaseFactory.currentPlatform,
  );

  // Secure Storage
  await SecureStorageFactory().onInit();

  // Local Database
  LocalDatabaseFactory.onInit();

  // Notification
  await NotificationUtil.initialize();
  await NotificationUtil.setupRemoteNotification();

  // await deleteDatabase();
}

Future<void> onSystemReady() async {
  // Notification
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    NotificationUtil.onForegroundHandler(message);
  });

  FirebaseMessaging.onBackgroundMessage(
    NotificationUtil.onBackgroundHandler,
  );
}
