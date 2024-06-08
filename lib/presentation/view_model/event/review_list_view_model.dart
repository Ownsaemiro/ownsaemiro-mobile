import 'package:get/get.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/data/model/event/review_state.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_detail_view_model.dart';

class ReviewListViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final EventDetailViewModel _eventDetailViewModel;
  late final EventRepository _eventRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  final RxInt _eventId = 0.obs;
  late final RxList<ReviewState> _reviews;
  final RxBool _isLoading = false.obs;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  int get eventId => _eventId.value;

  List<ReviewState> get reviews => _reviews;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _eventDetailViewModel = Get.find<EventDetailViewModel>();
    _eventRepository = Get.find<EventRepository>();

    // Initialize State
    _reviews = <ReviewState>[].obs;
    _eventId.value = _eventDetailViewModel.eventDetailInfoState.id;
  }

  @override
  void onReady() {
    super.onReady();

    _isLoading.value = true;

    _eventRepository
        .getEventReviewList(eventId: eventId, page: 1, size: 8)
        .then((value) {
      _reviews.addAll(value);
    });

    _isLoading.value = false;
  }
}
