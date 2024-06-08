import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/binding/init_binding.dart';
import 'package:ownsaemiro/app/config/app_page.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      title: "Ownsaemiro",
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('ko', 'KR'),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Pretendard',
        colorSchemeSeed: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Routes.ENTRY,
      initialBinding: InitBinding(),
      getPages: appPages,
    );
  }
}
