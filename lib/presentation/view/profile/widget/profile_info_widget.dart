import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/app_routes.dart';
import 'package:ownsaemiro/app/config/font_system.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/point_charge_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/profile/profile_view_model.dart';
import 'package:ownsaemiro/presentation/view_model/root/root_view_model.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PROFILE_UPDATE);
                },
                child: const _ProfileWidget(),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.POINT_CHARGE);
              },
              child: const _WalletWidget(),
            ),
          ],
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: 25,
          child: Container(color: Colors.grey.shade200),
        ),
      ],
    );
  }
}

class _ProfileWidget extends BaseWidget<RootViewModel> {
  const _ProfileWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () {
        if (viewModel.isUserNameLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(left: 25, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const _ProfileImageWidget(),
              const SizedBox(width: 20),
              Text(viewModel.userNameState.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(width: 12),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProfileImageWidget extends BaseWidget<ProfileViewModel> {
  const _ProfileImageWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(() {
      if (viewModel.isProfileImageUploading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      String image = viewModel.userImageState.profileImage;

      return CircleAvatar(
        radius: 24,
        backgroundColor: Colors.grey.shade300,
        backgroundImage: image.isEmpty ? null : NetworkImage(image),
      );
    });
  }
}

class _WalletWidget extends BaseWidget<PointChargeViewModel> {
  const _WalletWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(() {
      if (viewModel.isPointCharging) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Padding(
        padding: const EdgeInsets.only(right: 25, top: 10),
        child: Row(
          children: [
            Text(
              '${viewModel.numberFormat.format(viewModel.userWalletState.point)} Coin',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.add_circle_outline,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      );
    });
  }
}
