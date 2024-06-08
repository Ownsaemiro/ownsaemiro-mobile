import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/presentation/view_model/entry/entry_view_model.dart';

class EntryScreen extends GetView<EntryViewModel> {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.primary.shade500, // 화면 배경 색상 설정
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 120),
              child: Image(
                image: AssetImage("assets/images/ownsaemiro.png"),
                width: 240,
                height: 240,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.snackbar(
                  "로그인 실패",
                  "네이버 로그인은 준비 중입니다.",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: ColorSystem.white,
                  colorText: ColorSystem.black,
                );
              },
              child: Container(
                width: 320,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF00C10F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "네이버로 온새미로 시작하기",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: () {
                controller.kakaoSignInAccount();
              },
              child: Container(
                width: 320,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEE500),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "카카오로 온새미로 시작하기",
                    style: TextStyle(
                        color: Color(0xFF391B1B),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: () {
                Get.snackbar(
                  "로그인 실패",
                  "구글 로그인은 준비 중입니다.",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: ColorSystem.white,
                  colorText: ColorSystem.black,
                );
              },
              child: Container(
                width: 320,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "구글로 온새미로 시작하기",
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
