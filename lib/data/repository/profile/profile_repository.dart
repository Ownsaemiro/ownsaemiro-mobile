import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:ownsaemiro/data/model/event/search_event_state.dart';
import 'package:ownsaemiro/data/model/profile/assignment_ticket_state.dart';
import 'package:ownsaemiro/data/model/profile/participated_event_state.dart';
import 'package:ownsaemiro/data/model/profile/profile_update_state.dart';
import 'package:ownsaemiro/data/model/profile/purchased_history_detail_state.dart';
import 'package:ownsaemiro/data/model/profile/purchased_history_state.dart';
import 'package:ownsaemiro/data/model/profile/user_liked_event_state.dart';

abstract class ProfileRepository {
  Future<List<UserLikedEventState>> getUserLikedEvent(
      {required int page, required int size});

  Future<List<PurchasedHistoryState>> getPurchasedList(
      {required int page, required int size});

  Future<PurchasedHistoryDetailState> getPurchasedDetail({required int id});

  Future<List<AssignmentTicketState>> getAssignmentList(
      {required int page, required int size});

  Future<void> cancelTicket({required int id});

  Future<ProfileUpdateState> updateProfile(
      {required String nickname, File? image});

  Future<List<ParticipatedEventState>> getParticipatedEvent(
      {required int page, required int size});

  Future<void> sendReview({required String content, required int eventId});

  Future<bool> acceptAssignmentTicket({required int id});
}
