import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/event/popular_event_state.dart';
import 'package:ownsaemiro/data/model/event/recommend_event_state.dart';
import 'package:ownsaemiro/data/provider/auth/auth_provider.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';
import 'package:ownsaemiro/presentation/view_model/entry/entry_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/root/root_view_model.dart';

class HomeViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final EventRepository _eventRepository;
  late final EntryViewModel _entryViewModel;
  late final AuthProvider _authProvider;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<PopularEventState> _popularEventList;
  late final RxList<RecommendEventState> _recommendEventList;
  late final RxBool _isPopularEventLoading = false.obs;
  late final RxBool _isRecommendEventLoading = false.obs;
  final RxString _fcmToken = "".obs;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<PopularEventState> get popularEventList => _popularEventList;

  List<RecommendEventState> get recommendEventList => _recommendEventList;

  bool get isPopularEventLoading => _isPopularEventLoading.value;

  bool get isRecommendEventLoading => _isRecommendEventLoading.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _eventRepository = Get.find<EventRepository>();
    _entryViewModel = Get.find<EntryViewModel>();
    _authProvider = Get.find<AuthProvider>();

    // Initialize State
    _popularEventList = <PopularEventState>[].obs;
    _recommendEventList = <RecommendEventState>[].obs;
  }

  @override
  void onReady() async {
    super.onReady();

    _fcmToken.value = _entryViewModel.fcmToken;
    await _authProvider.updateFcmToken(_fcmToken.value);

    _isPopularEventLoading.value = true;

    await _eventRepository.getPopularEventList().then((value) {
      _popularEventList.addAll(value);
    });

    _isPopularEventLoading.value = false;

    _isRecommendEventLoading.value = true;

    await _eventRepository.getRecommendEventList().then((value) {
      _recommendEventList.addAll(value);
    });

    _isRecommendEventLoading.value = false;
  }
}
