import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/presentation/widget/button/custom_icon_button.dart';

class DefaultBackAppBar extends StatelessWidget {
  const DefaultBackAppBar({
    super.key,
    required this.title,
    this.actions = const <CustomIconButton>[],
  });

  final String title;
  final List<CustomIconButton> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(title,
            style: FontSystem.KR18B.copyWith(color: const Color(0xFF555555))),
      ),
      centerTitle: true,
      surfaceTintColor: ColorSystem.white,
      backgroundColor: ColorSystem.white,
      automaticallyImplyLeading: true,
      titleSpacing: 0,
      leadingWidth: 50,
      leading: IconButton(
        padding: const EdgeInsets.only(top: 10, left: 10),
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          foregroundColor: ColorSystem.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        icon: SvgPicture.asset(
          "assets/icons/back_arrow.svg",
          width: 22,
          height: 19,
          colorFilter:
              const ColorFilter.mode(Color(0xFF555555), BlendMode.srcIn),
        ),
        onPressed: () => Get.back(),
      ),
    );
  }
}
