import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ownsaemiro/app/binding/root_binding.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/presentation/view/event/event_detail_screen.dart';
import 'package:ownsaemiro/presentation/view/event/event_reservation_screen.dart';
import 'package:ownsaemiro/presentation/view/event/review_list_screen.dart';
import 'package:ownsaemiro/presentation/view/home/notification_screen.dart';
import 'package:ownsaemiro/presentation/view/home/search_screen.dart';
import 'package:ownsaemiro/presentation/view/market/market_detail_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/assignment_waiting_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/liked_event_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/participated_event_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/point_charge_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/profile_update_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/purchase_history_detail_screen.dart';
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
      page: () => EventDetailScreen(),
      binding: RootBinding()),
  GetPage(
    name: Routes.EVENT_RESERVATION,
    page: () => const EventReservationScreen(),
    binding: RootBinding(),
  ),
  GetPage(
    name: Routes.NOTIFICATION,
    page: () => const NotificationScreen(),
    binding: RootBinding(),
  ),
  GetPage(
    name: Routes.SEARCH,
    page: () => const SearchScreen(),
    binding: RootBinding(),
  ),
  GetPage(
    name: Routes.MARKET_DETAIL,
    page: () => MarketDetailScreen(),
    binding: RootBinding(),
  ),
  GetPage(
    name: Routes.PURCHASE_HISTORY_DETAIL,
    page: () => const PurchaseHistoryDetailScreen(),
    binding: RootBinding(),
  ),
  GetPage(
    name: Routes.ASSIGNMENT_WAITING_LIST,
    page: () => const AssignmentWaitingScreen(),
    binding: RootBinding(),
  ),
  GetPage(
    name: Routes.PROFILE_UPDATE,
    page: () => const ProfileUpdateScreen(),
    binding: RootBinding(),
  ),
  GetPage(
    name: Routes.POINT_CHARGE,
    page: () => const PointChargeScreen(),
    binding: RootBinding(),
  ),
  GetPage(
    name: Routes.REVIEW_LIST,
    page: () => const ReviewListScreen(),
    binding: RootBinding(),
  ),
];
