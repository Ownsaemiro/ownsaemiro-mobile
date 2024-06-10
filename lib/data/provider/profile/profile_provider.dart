import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ProfileProvider {
  Future<Map<String, dynamic>> getUserLikedEvent(
      {required int page, required int size});

  Future<Map<String, dynamic>> getPurchasedList(
      {required int page, required int size});

  Future<Map<String, dynamic>> getPurchasedDetail({required int id});

  Future<Map<String, dynamic>> getAssignmentList(
      {required int page, required int size});

  Future<void> cancelTicket({required int id});

  Future<Map<String, dynamic>> updateProfile(
      {required String nickname, File? image});

  Future<Map<String, dynamic>> getParticipatedEvent(
      {required int page, required int size});

  Future<void> sendReview({required String content, required int eventId});

  Future<Map<String, dynamic>> acceptAssignmentTicket({required int id});
}
