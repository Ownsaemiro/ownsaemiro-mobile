import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/event/event_brief_state.dart';

class EventViewModel extends GetxController {
  final EventBriefState _eventBriefState = EventBriefState(
    id: 0,
    image: "",
    title: "",
    date: "",
  );

  EventBriefState get eventBriefState => _eventBriefState;

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

  void setEventBriefState({
    required int id,
    required String image,
    required String title,
    required String date,
  }) {
    _eventBriefState.copyWith(
      id: id,
      image: image,
      title: title,
      date: date,
    );
  }
}
