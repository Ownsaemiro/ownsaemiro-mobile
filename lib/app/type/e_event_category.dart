enum EEventCategory {
  all("전체", "ALL"),
  musical("뮤지컬", "MUSICAL"),
  exhibition("전시", "EXHIBITION"),
  theater("연극", "THEATER"),
  concert("콘서트", "CONCERT"),
  sport("스포츠", "SPORT"),
  ;

  final String koName;
  final String enName;

  const EEventCategory(this.koName, this.enName);

  // EEventCategory from koName
  static EEventCategory fromKoName(String koName) {
    return EEventCategory.values
        .firstWhere((category) => category.koName == koName);
  }
}
