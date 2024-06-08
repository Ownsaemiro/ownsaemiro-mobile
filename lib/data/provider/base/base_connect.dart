import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/factory/secure_storage_factory.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/data/provider/token/token_provider.dart';

abstract class BaseConnect extends GetConnect {
  final TokenProvider tokenProvider = SecureStorageFactory.tokenProvider;

  @override
  void onInit() {
    super.onInit();
    httpClient
      ..baseUrl = dotenv.env['API_URL']
      ..defaultContentType = "application/json"
      ..timeout = const Duration(seconds: 30)
      ..addRequestModifier<dynamic>((request) {
        request.headers['Authorization'] =
            'Bearer ${tokenProvider.accessToken}';

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
