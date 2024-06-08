import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/profile/user_liked_event_state.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository.dart';

class LikedEventViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ProfileRepository _profileRepository;
  late final EventRepository _eventRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<UserLikedEventState> _userLikedEventState;
  late final RxBool _isLoaded = false.obs;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<UserLikedEventState> get userLikedEventState => _userLikedEventState;

  bool get isLoaded => _isLoaded.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _profileRepository = Get.find<ProfileRepository>();
    _eventRepository = Get.find<EventRepository>();

    // Initialize State
    _userLikedEventState = <UserLikedEventState>[].obs;
  }

  @override
  void onReady() async {
    super.onReady();

    _isLoaded.value = true;

    await _profileRepository.getUserLikedEvent(page: 1, size: 8).then((value) {
      _userLikedEventState.value = value;
    });

    _isLoaded.value = false;
  }

  void unlikeEvent(int eventId) {
    UserLikedEventState event =
        _userLikedEventState.firstWhere((event) => event.id == eventId);

    // check is_liked is true
    if (!event.isLiked) return;

    // Call API to Unlike Event
    _eventRepository.eventUnlike(eventId: eventId);

    // Remove Event from State
    _userLikedEventState.removeWhere((event) => event.id == eventId);
  }
}
