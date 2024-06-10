import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/data/model/profile/assignment_ticket_state.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository.dart';

class AssignmentWaitingViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ProfileRepository _profileRepository;
  late final ScrollController _scrollController;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<AssignmentTicketState> _assignmentList;
  final RxBool _isLoading = false.obs;
  final RxBool _isLoadingMore = false.obs;

  int _page = 1;
  bool _hasMore = true;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<AssignmentTicketState> get assignmentList => _assignmentList;

  ScrollController get scrollController => _scrollController;

  bool get isLoading => _isLoading.value;

  bool get isLoadingMore => _isLoadingMore.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _profileRepository = Get.find<ProfileRepository>();
    _scrollController = ScrollController();

    // Initialize
    _assignmentList = <AssignmentTicketState>[].obs;
  }

  @override
  void onReady() async {
    super.onReady();

    await _fetchData();
  }

  Future<void> _fetchData() async {
    if (_isLoadingMore.value) return;
    _isLoadingMore.value = true;

    try {
      final data =
          await _profileRepository.getAssignmentList(page: _page, size: 8);
      if (data.isEmpty) {
        _hasMore = false;
      } else {
        _assignmentList.addAll(data);
        _page += 2;
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    _isLoadingMore.value = false;
  }

  Future<void> fetchMoreData() async {
    if (_isLoadingMore.value || !_hasMore) return;

    _isLoadingMore.value = true;

    try {
      final data =
          await _profileRepository.getAssignmentList(page: _page, size: 4);

      if (data.isEmpty) {
        _hasMore = false;
      } else {
        _assignmentList.addAll(data);
        _page++;
      }
    } finally {
      _isLoadingMore.value = false;
    }
  }

  Future<bool> acceptAssignmentTicket(int id) async {
    try {
      final result = await _profileRepository.acceptAssignmentTicket(id: id);

      if (result) {
        _assignmentList.removeWhere((element) => element.id == id);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      LogUtil.error(e.toString());
    }

    return false;
  }
}
