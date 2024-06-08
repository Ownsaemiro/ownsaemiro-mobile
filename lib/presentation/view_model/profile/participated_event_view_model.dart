import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/profile/participated_event_state.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository.dart';

class ParticipatedEventViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ProfileRepository _profileRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<ParticipatedEventState> _state;
  late final TextEditingController _reviewController;
  final RxBool _isLoading = false.obs;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<ParticipatedEventState> get state => _state;

  bool get isLoading => _isLoading.value;

  TextEditingController get reviewController => _reviewController;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _profileRepository = Get.find<ProfileRepository>();

    // Initialize State
    _state = <ParticipatedEventState>[].obs;
    _reviewController = TextEditingController();
  }

  @override
  void onReady() async {
    super.onReady();

    _isLoading.value = true;

    await _profileRepository
        .getParticipatedEvent(page: 1, size: 8)
        .then((value) {
      _state.addAll(value);
    });

    _isLoading.value = false;
  }

  void sendReview(int id) async {
    await _profileRepository.sendReview(
        eventId: id, content: _reviewController.text);

    _reviewController.clear();
  }
}
