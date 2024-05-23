class EventBriefState {
  final int id;
  final String image;
  final String title;
  final String date;

  EventBriefState({
    required this.id,
    required this.image,
    required this.title,
    required this.date,
  });

  EventBriefState copyWith({
    int? id,
    String? image,
    String? title,
    String? date,
  }) {
    return EventBriefState(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      date: date ?? this.date,
    );
  }

  factory EventBriefState.fromJson(Map<String, dynamic> json) {
    return EventBriefState(
      id: json["id"],
      image: json["image"],
      title: json["title"],
      date: json["date"],
    );
  }
}
