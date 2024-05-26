import 'package:get/get.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/home/home_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/market/market_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/profile/liked_event_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/profile/profile_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/root/root_view_model.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootViewModel>(() => RootViewModel());

    HomeBinding().dependencies();
    EventBinding().dependencies();
    MarketBinding().dependencies();
    ProfileBinding().dependencies();
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
  }
}

class MarketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarketViewModel>(() => MarketViewModel());
  }
}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileViewModel>(() => ProfileViewModel());
    Get.lazyPut<LikedEventViewModel>(() => LikedEventViewModel());
  }
}
