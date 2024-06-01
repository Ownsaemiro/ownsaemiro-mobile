import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';

class ProfileListWidget extends StatelessWidget {
  const ProfileListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.favorite_border, color: Colors.grey),
              title: const Text("내가 찜한"),
              onTap: () => Navigator.pushNamed(context, Routes.LIKED_EVENT),
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long, color: Colors.grey),
              title: const Text("구매 내역"),
              onTap: () =>
                  Navigator.pushNamed(context, Routes.PURCHASE_HISTORY),
            ),
            ListTile(
              leading: const Icon(Icons.event, color: Colors.grey),
              title: const Text("참여한 행사"),
              onTap: () =>
                  Navigator.pushNamed(context, Routes.PARTICIPATED_EVENT),
            ),
            ListTile(
              // custom Icon from assets
              leading: SvgPicture.asset(
                "assets/icons/transfer.svg",
                width: 16,
                height: 16,
              ),
              title: const Text("양도 대기 목록"),
              onTap: () =>
                  Navigator.pushNamed(context, Routes.ASSIGNMENT_WAITING_LIST),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.grey),
              title: const Text("회원 탈퇴"),
              onTap: () {},
            ),
          ],
        ));
  }
}
