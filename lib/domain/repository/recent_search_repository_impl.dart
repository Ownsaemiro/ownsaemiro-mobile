import 'package:drift/drift.dart' as drift;
import 'package:get/get.dart';
import 'package:ownsaemiro/app/database/local_database.dart';
import 'package:ownsaemiro/app/factory/local_database_factory.dart';
import 'package:ownsaemiro/domain/dao/recent_search_dao.dart';
import 'package:ownsaemiro/domain/repository/recent_search_repository.dart';

class RecentSearchRepositoryImpl extends GetxService
    implements RecentSearchRepository {
  late final RecentSearchDao _recentSearchDao;

  @override
  void onInit() {
    super.onInit();

    // Dependency injection
    _recentSearchDao = LocalDatabaseFactory.instance.recentSearchDao;
  }

  @override
  Future<int> addSearch(String keyword) {
    final entry = RecentSearchCompanion(keyword: drift.Value(keyword));
    return _recentSearchDao.addSearch(entry);
  }

  @override
  Future<int> deleteSearch(int id) {
    return _recentSearchDao.deleteSearch(id);
  }

  @override
  Future<List<RecentSearchData>> getRecentSearches() {
    return _recentSearchDao.getRecentSearches();
  }
}
