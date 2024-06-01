import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/config/color_system.dart';

class DefaultProfileAppBar extends StatelessWidget {
  const DefaultProfileAppBar({super.key, this.onNotificationPress});

  final Function()? onNotificationPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorSystem.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      titleSpacing: 0,
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "마이페이지",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorSystem.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
