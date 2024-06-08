class PurchasedHistoryDetailState {
  final int id;
  final String image;
  final String title;
  final String category;
  final String durationTime;
  final String rating;
  final String address;
  final String duration;
  final String cellPhoneNumber;
  final String transactionId;
  final String activatedAt;
  final int userId;
  final String ticketHash;

  PurchasedHistoryDetailState({
    required this.id,
    required this.image,
    required this.title,
    required this.category,
    required this.durationTime,
    required this.rating,
    required this.address,
    required this.duration,
    required this.cellPhoneNumber,
    required this.transactionId,
    required this.activatedAt,
    required this.userId,
    required this.ticketHash,
  });

  PurchasedHistoryDetailState copyWith({
    int? id,
    String? image,
    String? title,
    String? category,
    String? durationTime,
    String? rating,
    String? address,
    String? duration,
    String? cellPhoneNumber,
    String? transactionId,
    String? activatedAt,
    int? userId,
    String? ticketHash,
  }) {
    return PurchasedHistoryDetailState(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      category: category ?? this.category,
      durationTime: durationTime ?? this.durationTime,
      rating: rating ?? this.rating,
      address: address ?? this.address,
      duration: duration ?? this.duration,
      cellPhoneNumber: cellPhoneNumber ?? this.cellPhoneNumber,
      transactionId: transactionId ?? this.transactionId,
      userId: userId ?? this.userId,
      activatedAt: activatedAt ?? this.activatedAt,
      ticketHash: ticketHash ?? this.ticketHash,
    );
  }

  factory PurchasedHistoryDetailState.fromJson(Map<String, dynamic> json) {
    return PurchasedHistoryDetailState(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      category: json['category'],
      durationTime: json['duration_time'],
      rating: json['rating'],
      address: json['address'],
      duration: json['duration'],
      activatedAt: json['activate_date'],
      cellPhoneNumber: json['cell_phone_number'],
      transactionId: json['transaction_number'],
      userId: json['buyer_id'],
      ticketHash: json['event_hash'],
    );
  }
}
