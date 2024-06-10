import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/data/model/profile/assignment_ticket_state.dart';
import 'package:ownsaemiro/presentation/view_model/profile/assignment_waiting_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

class AssignmentTicketScreen extends BaseScreen<AssignmentWaitingViewModel> {
  AssignmentTicketScreen({super.key});

  final AssignmentTicketState state = Get.arguments;

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: DefaultBackAppBar(title: "양도 티켓 수령하기"),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 60),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: Get.width * 0.8,
              height: Get.height * 0.5,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(state.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          state.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.duration,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorSystem.primary,
              minimumSize: Size(Get.width * 0.8, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () async {
              bool result = await viewModel.acceptAssignmentTicket(state.id);

              if (result == true) {
                Get.back();

                Get.snackbar("알림", "양도 티켓 수령이 완료되었습니다.",
                    backgroundColor: Colors.white, colorText: Colors.black);
              } else {
                Get.snackbar("알림", "양도 티켓 수령에 실패했습니다. 잔고를 확인하세요.",
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.white,
                    colorText: Colors.black);
              }
            },
            child: const Text("양도 티켓 수령하기",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
