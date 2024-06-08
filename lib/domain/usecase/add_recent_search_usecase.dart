import 'package:ownsaemiro/core/usecase/param_usecase.dart';
import 'package:ownsaemiro/domain/repository/recent_search_repository.dart';

class AddRecentSearchUseCase extends ParamUseCase<int, String> {
  late final RecentSearchRepository _recentSearchRepository;

  AddRecentSearchUseCase(this._recentSearchRepository);

  @override
  Future<int> execute(String params) {
    return _recentSearchRepository.addSearch(params);
  }
}
