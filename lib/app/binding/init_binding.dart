import 'package:get/get.dart';
import 'package:ownsaemiro/data/provider/auth/auth_provider.dart';
import 'package:ownsaemiro/data/provider/auth/auth_provider_impl.dart';
import 'package:ownsaemiro/data/provider/event/event_provider.dart';
import 'package:ownsaemiro/data/provider/event/event_provider_impl.dart';
import 'package:ownsaemiro/data/provider/market/market_provider.dart';
import 'package:ownsaemiro/data/provider/market/market_provider_impl.dart';
import 'package:ownsaemiro/data/provider/profile/profile_provider.dart';
import 'package:ownsaemiro/data/provider/profile/profile_provider_impl.dart';
import 'package:ownsaemiro/data/provider/user/user_provider.dart';
import 'package:ownsaemiro/data/provider/user/user_provider_impl.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';
import 'package:ownsaemiro/data/repository/event/event_repository_impl.dart';
import 'package:ownsaemiro/data/repository/market/market_repository.dart';
import 'package:ownsaemiro/data/repository/market/market_repository_impl.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository.dart';
import 'package:ownsaemiro/data/repository/profile/profile_repository_impl.dart';
import 'package:ownsaemiro/data/repository/user/user_repository.dart';
import 'package:ownsaemiro/data/repository/user/user_repository_impl.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // Provider Binding
    Get.putAsync<AuthProvider>(
      () async => AuthProviderImpl(),
    );
    Get.lazyPut<EventProvider>(() => EventProviderImpl());
    Get.lazyPut<UserProvider>(() => UserProviderImpl());
    Get.lazyPut<MarketProvider>(() => MarketProviderImpl());
    Get.lazyPut<ProfileProvider>(() => ProfileProviderImpl());

    // Repository Binding
    Get.lazyPut<EventRepository>(() => EventRepositoryImpl());
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl());
    Get.lazyPut<MarketRepository>(() => MarketRepositoryImpl());
    Get.lazyPut<ProfileRepository>(() => ProfileRepositoryImpl());
  }
}
