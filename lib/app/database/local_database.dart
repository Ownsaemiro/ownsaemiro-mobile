import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
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

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          LogUtil.info('Creating database');
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          LogUtil.info('Upgrading database from $from to $to');
        },
        beforeOpen: (details) async {
          if (details.wasCreated) {
            LogUtil.info('Database was created');
          } else if (details.hadUpgrade) {
            LogUtil.info('Database was upgraded');
          }
        },
      );
}
