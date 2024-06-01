import 'package:get/get.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';

class ReviewListViewModel extends GetxController {
  final RxList<String> reviews = <String>[].obs;
  final RxInt _currentPage = 1.obs;
  final RxInt _totalPage = 100.obs;

  int get currentPage => _currentPage.value;

  int get totalPage => _totalPage.value;

  void setCurrentPage(int page) {
    _currentPage.value = page;
  }

  void setTotalPage(int page) {
    _totalPage.value = page;
  }

  @override
  void onInit() {
    super.onInit();
    fetchReviews();
  }

  void fetchReviews() {
    List<String> newReviews =
        List.generate(8, (index) => '리뷰 ${index + 1 + (currentPage - 1) * 8}');
    reviews.addAll(newReviews);
  }

  void loadMoreReviews() {
    LogUtil.info('currentPage: $currentPage, totalPage: $totalPage');

    if (currentPage < totalPage) {
      setCurrentPage(currentPage + 1);
      List<String> newReviews = List.generate(
          8, (index) => '리뷰 ${index + 1 + (currentPage - 1) * 8}');
      reviews.addAll(newReviews);
    }
  }
}
