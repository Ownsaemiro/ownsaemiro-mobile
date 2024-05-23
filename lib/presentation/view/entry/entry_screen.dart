import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';

class EntryScreen extends BaseScreen {
  const EntryScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Entry Screen'),
    );
  }

  @override
  Color get screenBackgroundColor => ColorSystem.primary.shade500;
}
