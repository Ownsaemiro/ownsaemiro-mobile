import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_reservation_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';
import 'package:table_calendar/table_calendar.dart';

class EventReservationScreen extends BaseScreen<EventReservationViewModel> {
  const EventReservationScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DefaultBackAppBar(title: ""));
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Column(children: [
      _TopWidget(),
      // _MiddleWidget(),
    ]);
  }
}

class _TopWidget extends StatelessWidget {
  const _TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: Get.width,
        height: Get.width * 0.45,
        color: ColorSystem.primary,
      ),
      const Positioned(
          bottom: 20,
          left: 20,
          child: Text("핫소스유니버스 팝업스토어",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )))
    ]);
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
    return TableCalendar(
        locale: Get.deviceLocale.toString(),
        firstDay: DateTime.now().subtract(const Duration(days: 365 * 10 + 2)),
        lastDay: DateTime.now().add(const Duration(days: 365 * 10 + 2)),
        currentDay: DateTime.now(),
        focusedDay: DateTime.now(),
        daysOfWeekHeight: 30,
        rowHeight: 55,
        calendarStyle: const CalendarStyle(outsideDaysVisible: false),
        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) {
            switch (day.weekday) {
              case DateTime.sunday:
                return const Center(
                    child: Text(
                  "일",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ));
              case DateTime.saturday:
                return const Center(
                    child: Text(
                  "토",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ));
              default:
                return Center(
                    child: Text(
                  '일월화수목금토'[day.weekday - 1],
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ));
            }
          },
          defaultBuilder: (context, day, focusedDay) {
            switch (day.weekday) {
              case DateTime.sunday:
                return Center(
                  child: Text(
                    day.day.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                );

              case DateTime.saturday:
                return Center(
                  child: Text(
                    day.day.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                );

              default:
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
            }
          },
          todayBuilder: (context, day, focusedDay) {
            switch (day.weekday) {
              case DateTime.sunday:
                return Center(
                  child: Text(
                    day.day.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                );
              case DateTime.saturday:
                return Center(
                  child: Text(
                    day.day.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                );
              default:
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
            }
          },
          selectedBuilder: (context, day, focusedDay) {
            return Center(
                child: Container(
                    decoration: const BoxDecoration(
                        color: ColorSystem.primary, shape: BoxShape.circle),
                    child: Center(
                        child: Text(day.day.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            )))));
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
          return isSameDay(viewModel.selectedDate, day);
        },
        availableCalendarFormats: const {CalendarFormat.month: "한 달씩 보기"},
        onDaySelected: (selectedDay, focusedDay) {
          viewModel.onDaySelected(selectedDay, focusedDay);
        });
  }
}
