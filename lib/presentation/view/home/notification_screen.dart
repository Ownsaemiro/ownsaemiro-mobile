import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view_model/notification/notification_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

class NotificationScreen extends BaseScreen<NotificationViewModel> {
  const NotificationScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DefaultBackAppBar(title: "알림"));
  }

  @override
  Widget buildBody(BuildContext context) {
    return Obx(() {
      if (viewModel.notificationList.isEmpty) {
        return const Center(child: Text('알림이 없습니다.'));
      }

      return AnimatedList(
        padding: const EdgeInsets.all(16),
        key: viewModel.listKey,
        initialItemCount: viewModel.notificationList.length,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              child: NotificationItem(
                notification: viewModel.notificationList[index],
                onDelete: () => viewModel.delete(index),
              ),
            ),
          );
        },
      );
    });
  }
}

class NotificationItem extends StatelessWidget {
  final String notification;
  final VoidCallback onDelete;

  const NotificationItem(
      {super.key, required this.notification, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/notify.svg',
              height: 42,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                notification,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.grey),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
