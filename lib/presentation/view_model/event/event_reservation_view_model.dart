import 'package:get/get.dart';

class EventReservationViewModel extends GetxController {
  late final Rxn<DateTime> _selectedDate;

  DateTime? get selectedDate => _selectedDate.value;

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    _selectedDate.value = selectedDay;
  }
}
