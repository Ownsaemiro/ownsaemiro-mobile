import 'package:flutter/material.dart';
import 'package:ownsaemiro/view/base/base_screen.dart';
import 'package:ownsaemiro/view_model/home/home_view_model.dart';

class HomeScreen extends BaseScreen<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Home Screen'),
    );
  }
}
