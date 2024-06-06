import 'package:get/get.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_detail_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_reservation_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/event/review_list_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/home/home_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/market/market_detail_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/market/market_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/notification/notification_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/profile/assignment_waiting_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/profile/liked_event_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/profile/participated_event_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/profile/point_charge_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/profile/profile_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/profile/purchase_history_detail_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/profile/purchase_history_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/root/root_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/search/search_view_model.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootViewModel>(() => RootViewModel());

    HomeBinding().dependencies();
    EventBinding().dependencies();
    MarketBinding().dependencies();
    ProfileBinding().dependencies();
    NotificationBinding().dependencies();
    SearchBinding().dependencies();
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
  }
}

class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventViewModel>(() => EventViewModel());
    Get.lazyPut<EventDetailViewModel>(() => EventDetailViewModel());
    Get.lazyPut<EventReservationViewModel>(() => EventReservationViewModel());
    Get.lazyPut<ReviewListViewModel>(() => ReviewListViewModel());
  }
}

class MarketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarketViewModel>(() => MarketViewModel());
    Get.lazyPut<MarketDetailViewModel>(() => MarketDetailViewModel());
  }
}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileViewModel>(() => ProfileViewModel());
    Get.lazyPut<LikedEventViewModel>(() => LikedEventViewModel());
    Get.lazyPut<PurchaseHistoryViewModel>(() => PurchaseHistoryViewModel());
    Get.lazyPut<ParticipatedEventViewModel>(() => ParticipatedEventViewModel());
    Get.lazyPut<PurchaseHistoryDetailViewModel>(
        () => PurchaseHistoryDetailViewModel());
    Get.lazyPut<AssignmentWaitingViewModel>(() => AssignmentWaitingViewModel());
    Get.lazyPut<PointChargeViewModel>(() => PointChargeViewModel());
  }
}

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationViewModel>(() => NotificationViewModel());
  }
}

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchViewModel>(() => SearchViewModel());
  }
}
