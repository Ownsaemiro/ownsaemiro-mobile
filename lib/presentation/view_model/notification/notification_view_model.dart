// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ownsaemiro/presentation/view/home/notification_screen.dart';
//
// class NotificationViewModel extends GetxController {
//   var notificationList = <String>[].obs;
//
//   final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
//
//   @override
//   void onInit() {
//     fetchNotifications();
//     super.onInit();
//   }
//
//   void fetchNotifications() {
//     final fetchedNotifications = [
//       '공연 \'핫소스유니버스 팝업스토어\' 양도 티켓에 당첨 되었습니다! 해당 공연 티켓구매창으로 이동하여 티켓을 예매해주세요!',
//       '또는 문구 추천 받습니다..',
//       '공연 \'핫소스유니버스 팝업스토어\' 양도 티켓에 당첨 되었습니다! 해당 공연 티켓구매창으로 이동하여 티켓을 예매해주세요!',
//       '공연 \'핫소스유니버스 팝업스토어\' 양도 티켓에 당첨 되었습니다! 해당 공연 티켓구매창으로 이동하여 티켓을 예매해주세요!',
//       '공연 \'핫소스유니버스 팝업스토어\' 양도 티켓에 당첨 되었습니다! 해당 공연 티켓구매창으로 이동하여 티켓을 예매해주세요!',
//       '공연 \'핫소스유니버스 팝업스토어\' 양도 티켓에 당첨 되었습니다! 해당 공연 티켓구매창으로 이동하여 티켓을 예매해주세요!',
//       '공연 \'핫소스유니버스 팝업스토어\' 양도 티켓에 당첨 되었습니다! 해당 공연 티켓구매창으로 이동하여 티켓을 예매해주세요!',
//       '공연 \'핫소스유니버스 팝업스토어\' 양도 티켓에 당첨 되었습니다! 해당 공연 티켓구매창으로 이동하여 티켓을 예매해주세요!',
//       '공연 \'핫소스유니버스 팝업스토어\' 양도 티켓에 당첨 되었습니다! 해당 공연 티켓구매창으로 이동하여 티켓을 예매해주세요!',
//       '공연 \'핫소스유니버스 팝업스토어\' 양도 티켓에 당첨 되었습니다! 해당 공연 티켓구매창으로 이동하여 티켓을 예매해주세요!',
//       '공연 \'핫소스유니버스 팝업스토어\' 양도 티켓에 당첨 되었습니다! 해당 공연 티켓구매창으로 이동하여 티켓을 예매해주세요!',
//       '공연 \'핫소스유니버스 팝업스토어\' 양도 티켓에 당첨 되었습니다! 해당 공연 티켓구매창으로 이동하여 티켓을 예매해주세요!',
//       '공연 \'핫소스유니버스 팝업스토어\' 양도 티켓에 당첨 되었습니다! 해당 공연 티켓구매창으로 이동하여 티켓을 예매해주세요!',
//     ];
//
//     notificationList.clear();
//     notificationList.addAll(fetchedNotifications);
//   }
//
//   void clear() {
//     final int itemCount = notificationList.length;
//     for (int i = 0; i < itemCount; i++) {
//       listKey.currentState?.removeItem(
//         0,
//         (context, animation) =>
//             _buildRemovedItem(notificationList[0], animation),
//         duration: const Duration(milliseconds: 300),
//       );
//       notificationList.removeAt(0);
//     }
//   }
//
//   void delete(int index) {
//     final removedItem = notificationList[index];
//     listKey.currentState?.removeItem(
//       index,
//       (context, animation) => _buildRemovedItem(removedItem, animation),
//       duration: const Duration(milliseconds: 300),
//     );
//     notificationList.removeAt(index);
//   }
//
//   void refreshNotifications() {
//     notificationList.clear();
//     fetchNotifications();
//   }
//
//   Widget _buildRemovedItem(String item, Animation<double> animation) {
//     return FadeTransition(
//       opacity: animation,
//       child: SizeTransition(
//         sizeFactor: animation,
//         child: NotificationItem(
//           notification: item,
//           onDelete: () {},
//         ),
//       ),
//     );
//   }
// }
