import 'package:ownsaemiro/app/database/local_database.dart';

abstract class LocalDatabaseFactory {
  static LocalDatabase? _instance;

  static LocalDatabase get instance => _instance!;

  static void onInit() {
    _instance = LocalDatabase();
  }
}
