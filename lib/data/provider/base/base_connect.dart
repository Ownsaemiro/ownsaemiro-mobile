import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';

abstract class BaseConnect extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient
      ..baseUrl = dotenv.env['API_URL']
      ..defaultContentType = "application/json"
      ..timeout = const Duration(seconds: 30)
      ..addRequestModifier<dynamic>((request) {
        request.headers['Authorization'] =
            'Bearer eyJKV1QiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1dWlkIjozLCJyb2xlIjoiVVNFUiIsImlhdCI6MTcxNzc1MDAwOCwiZXhwIjoxNzE3ODM2NDA4fQ.l5tOgKPGvW8slPahiN_AuU4VyuzCFgZOMbTnIa2jstV_sb67w_vK9uwcC5bslmwIBl0Db4bpQO_XapIJ1XeqwA';

        LogUtil.info("🛫 [${request.method}] ${request.url} | START");
        return request;
      })
      ..addResponseModifier((request, Response response) {
        if (response.status.hasError) {
          LogUtil.info(
              "🚨 [${request.method}] ${request.url} | FAILED (${response.statusCode})");
        } else {
          LogUtil.info(
              "🛬 [${request.method}] ${request.url} | SUCCESS (${response.statusCode})");

          LogUtil.info(
              "🛬 [${request.method}] ${request.url} | BODY ${response.body}");
        }

        return response;
      });
  }
}
