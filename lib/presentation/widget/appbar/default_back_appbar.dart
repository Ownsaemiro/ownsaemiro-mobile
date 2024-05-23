import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/presentation/widget/button/custom_icon_button.dart';

class DefaultBackAppBar extends StatelessWidget {
  const DefaultBackAppBar(
      {super.key,
      required this.title,
      this.actions = const <CustomIconButton>[],
      this.onBackPress});

  final String title;
  final List<CustomIconButton> actions;
  final Function()? onBackPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(title,
            style: FontSystem.KR24B.copyWith(color: const Color(0xFF5356FF))),
      ),
      centerTitle: false,
      surfaceTintColor: ColorSystem.white,
      backgroundColor: ColorSystem.white,
      automaticallyImplyLeading: true,
      titleSpacing: 0,
      leadingWidth: 50,
      leading: IconButton(
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          foregroundColor: ColorSystem.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        icon: SvgPicture.asset(
          "assets/icons/back_arrow.svg",
          width: 24,
          height: 24,
          colorFilter:
              const ColorFilter.mode(Color(0xFF5356FF), BlendMode.srcIn),
        ),
        onPressed: onBackPress,
      ),
    );
  }
}
