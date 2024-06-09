import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:ownsaemiro/app/main_app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'app/factory/local_database_factory.dart';
import 'app/factory/secure_storage_factory.dart';

void main() async {
  await onSystemInit();
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

  await initializeDateFormatting();

  await dotenv.load(fileName: "assets/configs/.env");

  // Kakao SDK
  KakaoSdk.init(
      nativeAppKey: "${dotenv.env["KAKAO_NATIVE_APP_KEY"]}",
      javaScriptAppKey: "${dotenv.env["KAKAO_JAVASCRIPT_APP_KEY"]}");

  // Secure Storage
  await SecureStorageFactory().onInit();

  // Local Database
  LocalDatabaseFactory.onInit();

  // await deleteDatabase();
}
