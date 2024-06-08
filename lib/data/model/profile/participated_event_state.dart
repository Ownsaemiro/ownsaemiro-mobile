class ParticipatedEventState {
  final int id;
  final String image;
  final String title;
  final String activatedAt;
  final String boughtAt;
  final String transactionId;

  ParticipatedEventState({
    required this.id,
    required this.image,
    required this.title,
    required this.activatedAt,
    required this.boughtAt,
    required this.transactionId,
  });

  ParticipatedEventState copyWith({
    int? id,
    String? image,
    String? title,
    String? activatedAt,
    String? boughtAt,
    String? transactionId,
  }) {
    return ParticipatedEventState(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      activatedAt: activatedAt ?? this.activatedAt,
      boughtAt: boughtAt ?? this.boughtAt,
      transactionId: transactionId ?? this.transactionId,
    );
  }

  factory ParticipatedEventState.fromJson(Map<String, dynamic> json) {
    return ParticipatedEventState(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      activatedAt: json['activated_at'],
      boughtAt: json['bought_at'],
      transactionId: json['order_id'],
    );
  }
}
