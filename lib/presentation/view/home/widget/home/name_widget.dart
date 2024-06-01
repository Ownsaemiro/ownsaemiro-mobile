import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/config/font_system.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(left: 25, top: 25),
        child: Text("온새미로 님을 위한 추천", style: FontSystem.KR18SB));
  }
}
