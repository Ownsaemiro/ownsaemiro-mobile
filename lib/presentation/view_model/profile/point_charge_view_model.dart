import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PointChargeViewModel extends GetxController {
  var point = 0.obs;
  final numberFormat = NumberFormat("#,###");

  void addDigit(int digit) {
    if (point.value == 0) {
      point.value = digit;
    } else {
      point.value = int.parse("${point.value}$digit");
    }
  }

  void removeDigit() {
    if (point.value > 9) {
      point.value = int.parse(point.value
          .toString()
          .substring(0, point.value.toString().length - 1));
    } else if (point.value > 0 && point.value < 10) {
      point.value = 0;
    }
  }

  void clear() {
    point.value = 0;
  }

  String get formattedPoint => numberFormat.format(point.value);
}
