import 'package:ownsaemiro/app/database/local_database.dart';
import 'package:ownsaemiro/core/usecase/no_param_usecase.dart';
import 'package:ownsaemiro/domain/repository/recent_search_repository.dart';

class GetRecentSearchesUseCase
    extends NoParamUseCase<List<RecentSearchStateData>> {
  late final RecentSearchRepository _recentSearchRepository;

  GetRecentSearchesUseCase(this._recentSearchRepository);

  @override
  Future<List<RecentSearchStateData>> execute() {
    return _recentSearchRepository.getRecentSearches();
  }
}
