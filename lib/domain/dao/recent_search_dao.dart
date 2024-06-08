import 'package:drift/drift.dart';
import 'package:ownsaemiro/app/database/local_database.dart';
import 'package:ownsaemiro/domain/entity/recent_search.dart';

part 'recent_search_dao.g.dart';

@DriftAccessor(tables: [RecentSearch])
class RecentSearchDao extends DatabaseAccessor<LocalDatabase>
    with _$RecentSearchDaoMixin {
  RecentSearchDao(super.db);

  Future<int> addSearch(RecentSearchCompanion entry) {
    return into(recentSearch).insert(entry);
  }

  Future<List<RecentSearchData>> getRecentSearches() {
    return (select(recentSearch)
          ..orderBy([(t) => OrderingTerm.desc(t.id)])
          ..limit(10))
        .get();
  }

  Future<int> deleteSearch(int id) {
    return (delete(recentSearch)..where((t) => t.id.equals(id))).go();
  }
}
