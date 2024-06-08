import 'package:get/get.dart';
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
}
