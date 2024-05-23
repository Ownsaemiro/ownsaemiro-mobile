import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ownsaemiro/app/config/color_system.dart';

class DefaultSearchAppBar extends StatelessWidget {
  const DefaultSearchAppBar(
      {super.key, this.onSearch, this.onNotificationPress});

  final Function(String)? onSearch;
  final Function()? onNotificationPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: ColorSystem.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              SvgPicture.asset(
                'assets/images/logo.svg',
                height: 32,
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    onChanged: onSearch,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Stack(children: [
                IconButton(
                  icon: const Icon(Icons.notifications,
                      color: ColorSystem.primary),
                  onPressed: onNotificationPress,
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
                    ))
              ])
            ])));
  }
}
