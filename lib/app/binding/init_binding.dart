import 'package:get/get.dart';
import 'package:ownsaemiro/data/provider/auth/auth_provider.dart';
import 'package:ownsaemiro/data/provider/auth/auth_provider_impl.dart';
import 'package:ownsaemiro/data/provider/event/event_provider.dart';
import 'package:ownsaemiro/data/provider/event/event_provider_impl.dart';
import 'package:ownsaemiro/data/repository/event/event_repository.dart';
import 'package:ownsaemiro/data/repository/event/event_repository_impl.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.putAsync<AuthProvider>(
      () async => AuthProviderImpl(),
    );
    Get.lazyPut<EventProvider>(() => EventProviderImpl());

    Get.lazyPut<EventRepository>(() => EventRepositoryImpl());
  }
}
