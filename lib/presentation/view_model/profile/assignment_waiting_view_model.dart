import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/profile/assignment_ticket_state.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository.dart';

class AssignmentWaitingViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ProfileRepository _profileRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<AssignmentTicketState> _assignmentList;
  final RxBool _isLoading = false.obs;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<AssignmentTicketState> get assignmentList => _assignmentList;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _profileRepository = Get.find<ProfileRepository>();

    // Initialize
    _assignmentList = <AssignmentTicketState>[].obs;
  }

  @override
  void onReady() {
    super.onReady();

    _isLoading.value = true;

    _profileRepository.getAssignmentList(page: 1, size: 8).then((value) {
      _assignmentList.value = value;
    });

    _isLoading.value = false;
  }
}
