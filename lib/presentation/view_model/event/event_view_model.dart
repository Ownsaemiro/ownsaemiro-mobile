import 'package:get/get.dart';
import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/data/model/event/before_event_state.dart';
import 'package:ownsaemiro/data/model/event/during_event_state.dart';
import 'package:ownsaemiro/data/model/event/event_brief_state.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';

class EventViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final EventRepository _eventRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<DuringEventState> _duringEventList;
  late final RxList<BeforeEventState> _beforeEventList;
  late final Rx<EEventCategory> _eventCategory;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<DuringEventState> get duringEventList => _duringEventList;

  List<BeforeEventState> get beforeEventList => _beforeEventList;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _eventRepository = Get.find<EventRepository>();

    // Initialize State
    _duringEventList = <DuringEventState>[].obs;
    _beforeEventList = <BeforeEventState>[].obs;
    _eventCategory = EEventCategory.all.obs;
  }

  @override
  void onReady() async {
    super.onReady();
    selectCategory(0);

    await _eventRepository
        .getBeforeEventList(
      page: 1,
      size: 5,
    )
        .then((value) {
      _beforeEventList.addAll(value);
    });

    await _eventRepository
        .getDuringEventList(
      page: 1,
      size: 5,
    )
        .then((value) {
      _duringEventList.addAll(value);
    });
  }

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
    "연극",
    "콘서트",
    "스포츠",
  ];

  void selectCategory(int index) async {
    selectedIndex.value = index;
    String category = chipList[index];

    _eventCategory.value = EEventCategory.fromKoName(category);

    _beforeEventList.clear();

    await _eventRepository
        .getBeforeEventList(
      page: 1,
      size: 5,
      category: _eventCategory.value,
    )
        .then((value) {
      _beforeEventList.addAll(value);
    });

    _duringEventList.clear();

    await _eventRepository
        .getDuringEventList(
      page: 1,
      size: 5,
      category: _eventCategory.value,
    )
        .then((value) {
      _duringEventList.addAll(value);
    });
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
