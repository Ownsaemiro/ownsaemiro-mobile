import 'package:drift/drift.dart';
import 'package:ownsaemiro/app/database/local_database.dart';
import 'package:ownsaemiro/domain/entity/recent_search_state.dart';

part 'recent_search_dao.g.dart';

@DriftAccessor(tables: [RecentSearchState])
class RecentSearchDao extends DatabaseAccessor<LocalDatabase>
    with _$RecentSearchDaoMixin {
  RecentSearchDao(super.db);

  Future<int> addSearch(RecentSearchStateCompanion entry) {
    return into(recentSearchState).insert(entry);
  }

  Future<List<RecentSearchStateData>> getRecentSearches() {
    return (select(recentSearchState)
          ..orderBy([(t) => OrderingTerm.desc(t.id)])
          ..limit(10))
        .get();
  }

  Future<int> deleteSearch(int id) {
    return (delete(recentSearchState)..where((t) => t.id.equals(id))).go();
  }
}
