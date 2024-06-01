import 'package:get/get.dart';

class EventReservationViewModel extends GetxController {
  late final Rxn<DateTime> _selectedDate;
  final RxBool isLoading = false.obs;

  DateTime? get selectedDate => _selectedDate.value;

  @override
  void onInit() {
    super.onInit();
    _selectedDate = Rxn<DateTime>(DateTime.now());
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    _selectedDate.value = selectedDay;
  }

  bool isEventAvailable(DateTime date) {
    final today = DateTime.now();

    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;
  }
}
