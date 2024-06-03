import 'package:get/get.dart';
import 'package:ownsaemiro/data/provider/base/base_connect.dart';
import 'package:ownsaemiro/data/provider/user/user_provider.dart';

class UserProviderImpl extends BaseConnect implements UserProvider {
  @override
  Future<Map<String, dynamic>> getUsername() async {
    final Response response;

    try {
      response = await get(
        "/api/users/nickname",
      );
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }
}
