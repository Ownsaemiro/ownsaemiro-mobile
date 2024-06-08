import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ownsaemiro/domain/dao/recent_search_dao.dart';
import 'package:ownsaemiro/domain/entity/recent_search.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'local_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'sqlite.db'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [RecentSearch], daos: [RecentSearchDao])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;
}
