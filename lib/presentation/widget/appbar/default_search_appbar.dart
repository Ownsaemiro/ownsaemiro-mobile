import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/config/color_system.dart';

class DefaultSearchAppBar extends StatelessWidget {
  const DefaultSearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: ColorSystem.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              height: 32,
            ),
            Row(children: [
              Stack(children: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: ColorSystem.primary,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.SEARCH);
                  },
                ),
              ]),
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: ColorSystem.primary,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.NOTIFICATION);
                    },
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 2,
                        minHeight: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }
}
