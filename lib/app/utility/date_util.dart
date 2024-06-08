abstract class DateUtil {
  static String getDottedFormattedDate(String date) {
    final dateList = date.split('~');

    final startDate = dateList[0];
    final endDate = dateList[1];

    final startDateList = startDate.split('-');
    final endDateList = endDate.split('-');

    return '${startDateList[1]}.${startDateList[2]} ~ ${endDateList[1]}.${endDateList[2]}';
  }

  static String getDottedDate(String date) {
    final dateList = date.split('-');

    return '${dateList[0]}.${dateList[1]}.${dateList[2]}';
  }

  static String getFormattedDateKo(String date) {
    final dateList = date.split('-');

    return '${dateList[0]}년 ${dateList[1]}월 ${dateList[2]}일';
  }
}
