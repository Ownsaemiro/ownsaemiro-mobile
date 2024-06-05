class TicketState {
  final int id;
  final String image;
  final String title;
  final String date;

  TicketState({
    required this.id,
    required this.image,
    required this.title,
    required this.date,
  });

  TicketState copyWith({
    int? id,
    String? image,
    String? title,
    String? date,
  }) {
    return TicketState(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      date: date ?? this.date,
    );
  }

  factory TicketState.fromJson(Map<String, dynamic> json) {
    return TicketState(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      date: json['duration'],
    );
  }
}
