import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ownsaemiro/data/provider/base/base_connect.dart';
import 'package:ownsaemiro/data/provider/profile/profile_provider.dart';

class ProfileProviderImpl extends BaseConnect implements ProfileProvider {
  @override
  Future<Map<String, dynamic>> getUserLikedEvent(
      {required int page, required int size}) async {
    final Response response;

    try {
      response = await get("/api/users/events/likes", query: {
        "page": page.toString(),
        "size": size.toString(),
      });
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }

  @override
  Future<Map<String, dynamic>> getPurchasedList(
      {required int page, required int size}) async {
    final Response response;

    try {
      response = await get("/api/tickets/purchasing", query: {
        "page": page.toString(),
        "size": size.toString(),
      });
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }

  @override
  Future<Map<String, dynamic>> getPurchasedDetail({required int id}) async {
    final Response response;

    try {
      response = await get("/api/tickets/purchasing/$id");
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }

  @override
  Future<Map<String, dynamic>> getAssignmentList(
      {required int page, required int size}) async {
    final Response response;

    try {
      response = await get("/api/tickets/assignment", query: {
        "page": page.toString(),
        "size": size.toString(),
      });
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }

  @override
  Future<void> cancelTicket({required int id}) async {
    final Response response;

    try {
      response = await patch("/api/tickets", {"ticket_id": id});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateProfile(
      {required String nickname, required XFile image}) async {
    final form = FormData({
      "message": {"nickname": nickname},
      "image": MultipartFile(image, filename: image.path.split('/').last),
    });

    try {
      await patch("/api/users", form);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getParticipatedEvent(
      {required int page, required int size}) async {
    final Response response;

    try {
      response = await get("/api/events/participate", query: {
        "page": page.toString(),
        "size": size.toString(),
      });
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }

  @override
  Future<void> sendReview(
      {required String content, required int eventId}) async {
    try {
      await post("/api/events/$eventId/review",
          {"content": content, "title": eventId.toString()});
    } catch (e) {
      rethrow;
    }
  }
}
