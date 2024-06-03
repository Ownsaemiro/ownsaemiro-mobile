abstract class DateUtil {
  static String getDottedFormattedDate(String date) {
    final dateList = date.split('~');

    final startDate = dateList[0];
    final endDate = dateList[1];

    final startDateList = startDate.split('-');
    final endDateList = endDate.split('-');

    return '${startDateList[1]}.${startDateList[2]} ~ ${endDateList[1]}.${endDateList[2]}';
  }
}
