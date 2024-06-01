import 'package:flutter/material.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view_model/profile/profile_update_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

class ProfileUpdateScreen extends BaseScreen<ProfileUpdateViewModel> {
  const ProfileUpdateScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: DefaultBackAppBar(title: "프로필 업데이트"),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text("프로필 업데이트"),
    );
  }
}
