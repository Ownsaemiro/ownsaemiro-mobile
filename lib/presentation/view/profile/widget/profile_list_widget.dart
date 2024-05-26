import 'package:flutter/material.dart';
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
              leading: const Icon(Icons.favorite_border),
              title: const Text("내가 찜한"),
              onTap: () => Navigator.pushNamed(context, Routes.LIKED_EVENT),
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text("구매내역"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text("참여한 행사"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("회원 탈퇴"),
              onTap: () {},
            ),
          ],
        ));
  }
}
