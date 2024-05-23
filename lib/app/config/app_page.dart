import 'package:get/get.dart';
import 'package:ownsaemiro/app/binding/root_binding.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/presentation/view/root/root_screen.dart';

List<GetPage> appPages = [
  GetPage(
    name: Routes.ROOT,
    page: () => const RootScreen(),
    binding: RootBinding(),
  ),
  GetPage(name: Routes.ENTRY, page: () => const RootScreen())
];
