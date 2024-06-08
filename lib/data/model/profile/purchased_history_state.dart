class PurchasedHistoryState {
  final int id;
  final String title;
  final String image;
  final String date;
  final String purchasedDate;
  final String transactionId;

  PurchasedHistoryState({
    required this.id,
    required this.title,
    required this.image,
    required this.date,
    required this.purchasedDate,
    required this.transactionId,
  });

  PurchasedHistoryState copyWith({
    int? id,
    String? title,
    String? image,
    String? date,
    String? purchasedDate,
    String? transactionId,
  }) {
    return PurchasedHistoryState(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      date: date ?? this.date,
      purchasedDate: purchasedDate ?? this.purchasedDate,
      transactionId: transactionId ?? this.transactionId,
    );
  }

  factory PurchasedHistoryState.fromJson(Map<String, dynamic> json) {
    return PurchasedHistoryState(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      date: json['date'],
      purchasedDate: json['purchased_date'],
      transactionId: json['transaction_number'],
    );
  }
}
