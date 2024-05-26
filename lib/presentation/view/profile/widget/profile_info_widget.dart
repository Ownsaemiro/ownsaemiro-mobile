import 'package:flutter/material.dart';
import 'package:ownsaemiro/app/config/font_system.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 25, top: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                Icons.person,
                size: 32,
                color: Colors.grey.shade600,
              )),
          const SizedBox(width: 20),
          const Text('온새미로', style: FontSystem.KR16SB),
        ]),
      ),
      const SizedBox(height: 35),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade200,
            foregroundColor: Colors.black,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: const Text(
            '프로필 수정',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ]);
  }
}
