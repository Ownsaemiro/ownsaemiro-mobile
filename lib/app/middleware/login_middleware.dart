import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/factory/secure_storage_factory.dart';
import 'package:ownsaemiro/data/provider/token/token_provider.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    TokenProvider userLocalProvider = SecureStorageFactory.tokenProvider;

    if (userLocalProvider.accessToken == null) {
      return const RouteSettings(name: Routes.ENTRY);
    }

    return null;
  }
}
