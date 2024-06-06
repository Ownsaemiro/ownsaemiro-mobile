import 'package:ownsaemiro/data/model/profile/user_liked_event_state.dart';

abstract class ProfileRepository {
  Future<List<UserLikedEventState>> getUserLikedEvent(
      {required int page, required int size});
}
