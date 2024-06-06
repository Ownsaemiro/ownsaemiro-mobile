import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/event/event_detail_brief_state.dart';
import 'package:ownsaemiro/data/model/event/event_detail_info_state.dart';
import 'package:ownsaemiro/data/model/event/event_review_state.dart';
import 'package:ownsaemiro/data/model/event/event_seller_info_state.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';

class EventDetailViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final EventRepository _eventRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final Rx<EventDetailInfoState> _eventDetailInfoState;
  late final Rx<EventDetailBriefState> _eventDetailBriefState;
  late final RxList<EventReviewState> _eventReviewState;
  late final Rx<EventSellerInfoState> _eventSellerInfoState;
  late final RxBool _isEventDetailLoading = false.obs;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  EventDetailInfoState get eventDetailInfoState => _eventDetailInfoState.value;

  EventDetailBriefState get eventDetailBriefState =>
      _eventDetailBriefState.value;

  List<EventReviewState> get eventReviewState => _eventReviewState;

  EventSellerInfoState get eventSellerInfoState => _eventSellerInfoState.value;

  bool get isEventDetailLoading => _isEventDetailLoading.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _eventRepository = Get.find<EventRepository>();

    // Initialize State
    _eventDetailInfoState = EventDetailInfoState(
      id: 0,
      title: "",
      image: "https://i.esdrop.com/d/f/hhaNifrpr0/U3CCAUKVbb.png",
      category: "",
      durationTime: "",
      rating: "",
      address: "",
      phoneNumber: "",
      price: 0,
      duration: "",
      isLiked: false,
    ).obs;

    _eventDetailBriefState = const EventDetailBriefState(description: "").obs;

    _eventReviewState = <EventReviewState>[].obs;

    _eventSellerInfoState = const EventSellerInfoState(
      director: "",
      durationTime: "",
      rating: "",
      address: "",
    ).obs;
  }

  void setEventDetailInfoState(int id) {
    _isEventDetailLoading.value = true;

    _eventRepository.getEventDetailInfo(eventId: id).then((value) {
      _eventDetailInfoState.value = value;
    });

    _eventRepository.getEventDetailBrief(eventId: id).then((value) {
      _eventDetailBriefState.value = value;
    });

    _eventRepository.getEventReviews(eventId: id).then((value) {
      _eventReviewState.value = value;
    });

    _eventRepository.getEventSellerInfo(eventId: id).then((value) {
      _eventSellerInfoState.value = value;
    });

    _isEventDetailLoading.value = false;
  }

  void pushLikeButton() {
    bool isLiked = _eventDetailInfoState.value.isLiked;

    if (isLiked) {
      _eventRepository.eventUnlike(eventId: _eventDetailInfoState.value.id);
    } else {
      _eventRepository.eventLike(eventId: _eventDetailInfoState.value.id);
    }

    _eventDetailInfoState.update((val) {
      val!.isLiked = !isLiked;
    });
  }
}
