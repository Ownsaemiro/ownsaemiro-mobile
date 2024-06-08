import 'package:intl/intl.dart';

abstract class NumberUtil {
  static String formatPrice(int price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(price);
  }
}
