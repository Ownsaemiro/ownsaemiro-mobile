import 'package:get/get.dart';
import 'package:ownsaemiro/binding/root_binding.dart';
import 'package:ownsaemiro/utility/static/app_routes.dart';
import 'package:ownsaemiro/view/root/root_screen.dart';

List<GetPage> appPages = [
  GetPage(
    name: Routes.ROOT,
    page: () => const RootScreen(),
    binding: RootBinding(),
  ),
];
