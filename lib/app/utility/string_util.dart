import 'package:ownsaemiro/app/type/e_event_category.dart';

abstract class StringUtil {
  static String getFormattedPhoneNumber(String data) {
    if (data.length == 11) {
      return data.replaceFirstMapped(RegExp(r'^(\d{3})(\d{4})(\d{4})$'),
          (match) => '${match[1]}-${match[2]}-${match[3]}');
    } else {
      return data;
    }
  }

  static String getCategoryKoName(String enName) {
    switch (enName) {
      case "MUSICAL":
        return "뮤지컬";
      case "EXHIBITION":
        return "전시";
      case "THEATER":
        return "연극";
      case "CONCERT":
        return "콘서트";
      case "SPORT":
        return "스포츠";
      default:
        return "전체";
    }
  }
}
