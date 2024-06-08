import 'package:ownsaemiro/core/usecase/param_usecase.dart';
import 'package:ownsaemiro/domain/repository/recent_search_repository.dart';

class DeleteRecentSearchUseCase extends ParamUseCase<int, int> {
  late final RecentSearchRepository _recentSearchRepository;

  DeleteRecentSearchUseCase(this._recentSearchRepository);

  @override
  Future<int> execute(int params) {
    return _recentSearchRepository.deleteSearch(params);
  }
}
