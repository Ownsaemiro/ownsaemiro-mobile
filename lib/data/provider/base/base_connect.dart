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
            'Bearer eyJKV1QiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1dWlkIjozLCJyb2xlIjoiVVNFUiIsImlhdCI6MTcxNzU5MjIwNSwiZXhwIjoxNzE3Njc4NjA1fQ.t8mgrq45bzVqhP9uzm6IPHHoi3WAz-PZwgz1DzQj1NOYua9PHyTmWNKM6nAAp_7BMw165qZRepMhZh2wgr0uGQ';

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
