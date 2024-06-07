import 'package:drift/drift.dart';

class RecentSearchState extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get keyword => text().withLength(min: 1, max: 255)();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
