import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/data/model/event/before_event_state.dart';
import 'package:ownsaemiro/data/model/event/during_event_state.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';

class EventViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final EventRepository _eventRepository;
  late final ScrollController _duringScrollController;
  late final ScrollController _beforeScrollController;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<DuringEventState> _duringEventList;
  late final RxList<BeforeEventState> _beforeEventList;
  late final Rx<EEventCategory> _eventCategory;

  late final RxBool _isDuringEventLoading = false.obs;
  late final RxBool _isBeforeEventLoading = false.obs;

  late final RxBool _isDuringEventMoreLoading = false.obs;
  late final RxBool _isBeforeEventMoreLoading = false.obs;

  int _duringPage = 1;
  int _beforePage = 1;

  bool _duringHasMore = true;
  bool _beforeHasMore = true;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<DuringEventState> get duringEventList => _duringEventList;

  List<BeforeEventState> get beforeEventList => _beforeEventList;

  ScrollController get duringScrollController => _duringScrollController;

  ScrollController get beforeScrollController => _beforeScrollController;

  bool get isDuringEventLoading => _isDuringEventLoading.value;

  bool get isBeforeEventLoading => _isBeforeEventLoading.value;

  bool get isDuringEventMoreLoading => _isDuringEventMoreLoading.value;

  bool get isBeforeEventMoreLoading => _isBeforeEventMoreLoading.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _eventRepository = Get.find<EventRepository>();
    _duringScrollController = ScrollController();
    _beforeScrollController = ScrollController();

    // Initialize State
    _duringEventList = <DuringEventState>[].obs;
    _beforeEventList = <BeforeEventState>[].obs;
    _eventCategory = EEventCategory.all.obs;
  }

  @override
  void onReady() async {
    super.onReady();
    selectCategory(0);
  }

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

    _beforePage = 1;

    await _loadBeforeEvent();

    _duringEventList.clear();

    _duringPage = 1;

    await _loadDuringEvent();
  }

  Future<void> _loadDuringEvent() async {
    if (_isDuringEventLoading.value) return;

    _isDuringEventLoading.value = true;

    try {
      final data = await _eventRepository.getDuringEventList(
        page: _duringPage,
        size: 5,
        category: _eventCategory.value,
      );

      if (data.isNotEmpty) {
        _duringEventList.addAll(data);
        _duringPage++;
      } else {
        _duringHasMore = false;
      }
    } finally {
      _isDuringEventLoading.value = false;
    }
  }

  Future<void> _loadBeforeEvent() async {
    if (_isBeforeEventLoading.value) return;

    _isBeforeEventLoading.value = true;

    try {
      final data = await _eventRepository.getBeforeEventList(
        page: _beforePage,
        size: 5,
        category: _eventCategory.value,
      );

      if (data.isNotEmpty) {
        _beforeEventList.addAll(data);
        _beforePage++;
      } else {
        _beforeHasMore = false;
      }
    } finally {
      _isBeforeEventLoading.value = false;
    }
  }

  Future<void> loadDuringEventMore() async {
    if (_isDuringEventMoreLoading.value || !_duringHasMore) return;

    _isDuringEventMoreLoading.value = true;

    try {
      final data = await _eventRepository.getDuringEventList(
        page: _duringPage,
        size: 3,
        category: _eventCategory.value,
      );

      if (data.isNotEmpty) {
        _duringEventList.addAll(data);
        _duringPage++;
      } else {
        _duringHasMore = false;
      }
    } finally {
      _isDuringEventMoreLoading.value = false;
    }
  }

  Future<void> loadBeforeEventMore() async {
    if (_isBeforeEventMoreLoading.value || !_beforeHasMore) return;

    _isBeforeEventMoreLoading.value = true;

    try {
      final data = await _eventRepository.getBeforeEventList(
        page: _beforePage,
        size: 3,
        category: _eventCategory.value,
      );

      if (data.isNotEmpty) {
        _beforeEventList.addAll(data);
        _beforePage++;
      } else {
        _beforeHasMore = false;
      }
    } finally {
      _isBeforeEventMoreLoading.value = false;
    }
  }
}
