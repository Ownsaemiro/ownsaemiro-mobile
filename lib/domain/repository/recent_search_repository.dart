import 'package:ownsaemiro/app/database/local_database.dart';

abstract class RecentSearchRepository {
  Future<int> addSearch(String keyword);

  Future<List<RecentSearchData>> getRecentSearches();

  Future<int> deleteSearch(int id);
}
