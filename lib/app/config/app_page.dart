import 'package:get/get.dart';
import 'package:ownsaemiro/app/binding/root_binding.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/presentation/view/event/event_detail_screen.dart';
import 'package:ownsaemiro/presentation/view/event/event_reservation_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/liked_event_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/participated_event_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/purchase_history_screen.dart';
import 'package:ownsaemiro/presentation/view/root/root_screen.dart';

List<GetPage> appPages = [
  GetPage(
    name: Routes.ROOT,
    page: () => const RootScreen(),
    binding: RootBinding(),
  ),
  GetPage(name: Routes.ENTRY, page: () => const RootScreen()),
  GetPage(
      name: Routes.LIKED_EVENT,
      page: () => const LikedEventScreen(),
      binding: RootBinding()),
  GetPage(
      name: Routes.PURCHASE_HISTORY,
      page: () => const PurchaseHistoryScreen(),
      binding: RootBinding()),
  GetPage(
    name: Routes.PARTICIPATED_EVENT,
    page: () => const ParticipatedEventScreen(),
    binding: RootBinding(),
  ),
  GetPage(
      name: Routes.EVENT_DETAIL,
      page: () => const EventDetailScreen(),
      binding: RootBinding()),
  GetPage(
    name: Routes.EVENT_RESERVATION,
    page: () => const EventReservationScreen(),
    binding: RootBinding(),
  )
];
