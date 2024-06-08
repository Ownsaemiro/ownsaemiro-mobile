import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/data/model/event/event_detail_brief_state.dart';
import 'package:ownsaemiro/data/model/event/event_detail_info_state.dart';
import 'package:ownsaemiro/data/model/event/event_review_state.dart';
import 'package:ownsaemiro/data/model/event/event_seller_info_state.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';
import 'package:ownsaemiro/presentation/view_model/profile/point_charge_view_model.dart';

class EventDetailViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final EventRepository _eventRepository;
  late final PointChargeViewModel _pointChargeViewModel;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final Rx<EventDetailInfoState> _eventDetailInfoState;
  late final Rx<EventDetailBriefState> _eventDetailBriefState;
  late final RxList<EventReviewState> _eventReviewState;
  late final Rx<EventSellerInfoState> _eventSellerInfoState;
  late final RxBool _isEventDetailLoading = false.obs;
  late final Rxn<DateTime> _selectedDate;
  late final RxInt _remainSeat = 0.obs;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  EventDetailInfoState get eventDetailInfoState => _eventDetailInfoState.value;

  EventDetailBriefState get eventDetailBriefState =>
      _eventDetailBriefState.value;

  List<EventReviewState> get eventReviewState => _eventReviewState;

  EventSellerInfoState get eventSellerInfoState => _eventSellerInfoState.value;

  bool get isEventDetailLoading => _isEventDetailLoading.value;

  DateTime? get selectedDate => _selectedDate.value;

  final RxBool isLoading = false.obs;

  int get remainSeat => _remainSeat.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _eventRepository = Get.find<EventRepository>();
    _pointChargeViewModel = Get.find<PointChargeViewModel>();

    // Initialize State
    _eventDetailInfoState = EventDetailInfoState(
      id: 0,
      title: "",
      image: "",
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

    _selectedDate = Rxn<DateTime>(DateTime.now());
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    _selectedDate.value = selectedDay;

    _remainSeat.value = await _eventRepository.getEventRemainSeats(
        eventId: _eventDetailInfoState.value.id);
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

  bool isEventAvailable() {
    DateTime selectDate = _selectedDate.value!;

    String duration = _eventDetailInfoState.value.duration;

    String startDate = duration.split(" ~ ")[0];
    String endDate = duration.split(" ~ ")[1];

    DateTime startDateTime = DateTime.parse(startDate);
    DateTime endDateTime = DateTime.parse(endDate);

    DateTime endOfDayDateTime = DateTime(
        endDateTime.year, endDateTime.month, endDateTime.day, 23, 59, 59);

    return selectDate.isAfter(startDateTime) &&
        selectDate.isBefore(endOfDayDateTime);
  }

  Future<bool> purchaseEvent() async {
    int point = _pointChargeViewModel.userWalletState.point;

    if (point < _eventDetailInfoState.value.price) {
      return false;
    }

    DateFormat dateFormat = DateFormat("yyyy-MM-dd");

    await _eventRepository.purchaseEventTicket(
        eventId: _eventDetailInfoState.value.id,
        date: dateFormat.format(_selectedDate.value!));

    return true;
  }
}
