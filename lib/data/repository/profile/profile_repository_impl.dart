import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/profile/assignment_ticket_state.dart';
import 'package:ownsaemiro/data/model/profile/purchased_history_detail_state.dart';
import 'package:ownsaemiro/data/model/profile/purchased_history_state.dart';
import 'package:ownsaemiro/data/model/profile/user_liked_event_state.dart';
import 'package:ownsaemiro/data/provider/profile/profile_provider.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository.dart';

class ProfileRepositoryImpl extends GetxService implements ProfileRepository {
  late final ProfileProvider _profileProvider;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _profileProvider = Get.find<ProfileProvider>();
  }

  @override
  Future<List<UserLikedEventState>> getUserLikedEvent(
      {required int page, required int size}) async {
    Map<String, dynamic> result;

    try {
      result = await _profileProvider.getUserLikedEvent(page: page, size: size);
    } catch (e) {
      rethrow;
    }

    return result["events"]
        .map<UserLikedEventState>(
            (event) => UserLikedEventState.fromJson(event))
        .toList();
  }

  @override
  Future<List<PurchasedHistoryState>> getPurchasedList(
      {required int page, required int size}) async {
    Map<String, dynamic> result;

    try {
      result = await _profileProvider.getPurchasedList(page: page, size: size);
    } catch (e) {
      rethrow;
    }

    return result["tickets"]
        .map<PurchasedHistoryState>(
            (ticket) => PurchasedHistoryState.fromJson(ticket))
        .toList();
  }

  @override
  Future<PurchasedHistoryDetailState> getPurchasedDetail(
      {required int id}) async {
    Map<String, dynamic> result;

    try {
      result = await _profileProvider.getPurchasedDetail(id: id);
    } catch (e) {
      rethrow;
    }

    return PurchasedHistoryDetailState.fromJson(result);
  }

  @override
  Future<List<AssignmentTicketState>> getAssignmentList(
      {required int page, required int size}) async {
    Map<String, dynamic> result;

    try {
      result = await _profileProvider.getAssignmentList(page: page, size: size);
    } catch (e) {
      rethrow;
    }

    return result["tickets"]
        .map<AssignmentTicketState>(
            (ticket) => AssignmentTicketState.fromJson(ticket))
        .toList();
  }

  @override
  Future<void> cancelTicket({required int id}) async {
    try {
      await _profileProvider.cancelTicket(id: id);
    } catch (e) {
      rethrow;
    }
  }
}
