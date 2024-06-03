class PopularEventState {
  final int id;
  final String title;
  final String image;
  final String duration;

  PopularEventState({
    required this.id,
    required this.title,
    required this.image,
    required this.duration,
  });

  PopularEventState copyWith({
    int? id,
    String? title,
    String? image,
    String? duration,
  }) {
    return PopularEventState(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      duration: duration ?? this.duration,
    );
  }

  factory PopularEventState.fromJson(Map<String, dynamic> json) {
    return PopularEventState(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      duration: json["duration"],
    );
  }
}
