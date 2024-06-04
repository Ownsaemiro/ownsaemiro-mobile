enum EEventStatus {
  before("BEFORE"),
  selling("SELLING"),
  ;

  final String value;

  const EEventStatus(this.value);

  @override
  toString() => value;
}
