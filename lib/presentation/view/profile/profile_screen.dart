import 'package:flutter/material.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view_model/profile/profile_view_model.dart';

class ProfileScreen extends BaseScreen<ProfileViewModel> {
  const ProfileScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}
