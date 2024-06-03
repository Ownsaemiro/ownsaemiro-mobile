import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/event/popular_event_state.dart';
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

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<PopularEventState> get popularEventList => _popularEventList;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _eventRepository = Get.find<EventRepository>();

    // Initialize State
    _popularEventList = <PopularEventState>[].obs;
  }

  @override
  void onReady() async {
    super.onReady();

    await _eventRepository.getPopularEventList().then((value) {
      _popularEventList.addAll(value);
    });
  }
}
