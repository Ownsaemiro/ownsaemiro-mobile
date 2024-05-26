import 'package:flutter/material.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/widget/profile_info_widget.dart';
import 'package:ownsaemiro/presentation/view/profile/widget/profile_list_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/profile_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_profile_appbar.dart';

class ProfileScreen extends BaseScreen<ProfileViewModel> {
  const ProfileScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: DefaultProfileAppBar(),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ProfileInfoWidget(),
      SizedBox(height: 20),
      ProfileListWidget(),
    ]));
  }
}
