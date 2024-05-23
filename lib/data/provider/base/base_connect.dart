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
        request.headers['Authorization'] = 'Bearer ';

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
