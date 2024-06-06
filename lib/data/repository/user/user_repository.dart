import 'package:ownsaemiro/data/model/user/user_image_state.dart';
import 'package:ownsaemiro/data/model/user/user_name_state.dart';
import 'package:ownsaemiro/data/model/user/user_wallet_state.dart';

abstract class UserRepository {
  Future<UserNameState> getUsername();

  Future<UserWalletState> getUserWallet();

  Future<UserWalletState> chargePoint(int point);

  Future<UserImageState> getUserProfile();
}
