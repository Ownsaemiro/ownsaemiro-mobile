import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_reservation_view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class EventReservationScreen extends BaseScreen<EventReservationViewModel> {
  const EventReservationScreen({super.key});

  void _showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: SizedBox(
            width: Get.width * 0.7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                SvgPicture.asset(
                  'assets/icons/notify.svg',
                  height: 64,
                ),
                const SizedBox(height: 16),
                const Text(
                  '성공적으로 예매했습니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorSystem.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    '확인',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Stack(
      children: [
        const Column(
          children: [
            _TopWidget(),
            _MiddleWidget(),
          ],
        ),
        Positioned(
          bottom: 120,
          left: 0,
          right: 0,
          child: Obx(
            () {
              final selectedDate = viewModel.selectedDate;

              LogUtil.info("selectedDate: $selectedDate");

              final isEventAvailable = selectedDate != null &&
                  viewModel.isEventAvailable(selectedDate);

              return Column(
                children: [
                  if (selectedDate != null)
                    Container(
                      padding: const EdgeInsets.all(40),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "결제 금액",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                isEventAvailable
                                    ? "12,000 원"
                                    : "해당 날짜에 공연이 없습니다.",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(isEventAvailable ? "남은 수량: 5" : "",
                              style:
                                  const TextStyle(color: ColorSystem.primary)),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () {
                  final selectedDate = viewModel.selectedDate;

                  final isEventAvailable = selectedDate != null &&
                      viewModel.isEventAvailable(selectedDate);

                  return ElevatedButton(
                    onPressed: isEventAvailable
                        ? () {
                            LogUtil.info("예매하기 버튼 클릭");
                            _showModal(context);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(Get.width * 0.9, 50),
                      backgroundColor: ColorSystem.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      elevation: 5,
                      shadowColor: Colors.black.withOpacity(0.3),
                    ),
                    child: const Text(
                      "예매하기",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 57,
              )
            ],
          ),
        )
      ],
    );
  }
}

class _TopWidget extends StatelessWidget {
  const _TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: Get.width * 0.45,
          color: ColorSystem.primary,
        ),
        const Positioned(
          bottom: 20,
          left: 20,
          child: Text(
            "핫소스유니버스 팝업스토어",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 10,
          child: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        )
      ],
    );
  }
}

class _MiddleWidget extends BaseWidget<EventReservationViewModel> {
  const _MiddleWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return const Column(children: [_CalendarWidget()]);
  }
}

class _CalendarWidget extends BaseWidget<EventReservationViewModel> {
  const _CalendarWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () {
          if (viewModel.isLoading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return TableCalendar(
              locale: Get.deviceLocale.toString(),
              firstDay:
                  DateTime.now().subtract(const Duration(days: 365 * 10 + 2)),
              lastDay: DateTime.now().add(const Duration(days: 365 * 10 + 2)),
              currentDay: DateTime.now(),
              focusedDay: viewModel.selectedDate ?? DateTime.now(),
              daysOfWeekHeight: 30,
              rowHeight: 55,
              calendarStyle: const CalendarStyle(
                outsideDaysVisible: false,
              ),
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  switch (day.weekday) {
                    case DateTime.sunday:
                      return const Center(
                        child: Text(
                          "일",
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      );
                    case DateTime.saturday:
                      return const Center(
                        child: Text(
                          "토",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      );
                    default:
                      return Center(
                        child: Text(
                          '일월화수목금토'[day.weekday - 1],
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      );
                  }
                },
                defaultBuilder: (context, day, focusedDay) {
                  return Center(
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: isSameDay(day, focusedDay)
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  );
                },
                todayBuilder: (context, day, focusedDay) {
                  return Center(
                    child: Text(
                      day.day.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
                selectedBuilder: (context, day, focusedDay) {
                  return Center(
                    child: Container(
                      width: 42,
                      decoration: const BoxDecoration(
                        color: ColorSystem.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(
                  fontSize: 22,
                ),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ),
              ),
              selectedDayPredicate: (day) {
                return isSameDay(day, controller.selectedDate);
              },
              availableCalendarFormats: const {
                CalendarFormat.month: "월",
              },
              onDaySelected: (selectedDay, focusedDay) {
                viewModel.onDaySelected(selectedDay, focusedDay);
              },
            );
          }
        },
      ),
    );
  }
}
