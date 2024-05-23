import 'package:get/get.dart';

class MarketViewModel extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<String> chipList = [
    "전체",
    "뮤지컬",
    "전시",
    "행사",
    "연극",
    "콘서트",
    "스포츠",
  ];

  void selectCategory(int index) {
    selectedIndex.value = index;
  }
}
