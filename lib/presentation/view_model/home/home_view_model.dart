import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/event/popular_event_state.dart';
import 'package:ownsaemiro/data/model/event/recommend_event_state.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';

class HomeViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final EventRepository _eventRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<PopularEventState> _popularEventList;
  late final RxList<RecommendEventState> _recommendEventList;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<PopularEventState> get popularEventList => _popularEventList;

  List<RecommendEventState> get recommendEventList => _recommendEventList;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _eventRepository = Get.find<EventRepository>();

    // Initialize State
    _popularEventList = <PopularEventState>[].obs;
    _recommendEventList = <RecommendEventState>[].obs;
  }

  @override
  void onReady() async {
    super.onReady();

    await _eventRepository.getPopularEventList().then((value) {
      _popularEventList.addAll(value);
    });

    await _eventRepository.getRecommendEventList().then((value) {
      _recommendEventList.addAll(value);
    });
  }
}
