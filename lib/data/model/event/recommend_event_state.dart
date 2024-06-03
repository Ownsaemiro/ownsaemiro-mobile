class RecommendEventState {
  final int id;
  final String title;
  final String image;
  final String address;
  final String duration;

  RecommendEventState({
    required this.id,
    required this.title,
    required this.image,
    required this.address,
    required this.duration,
  });

  RecommendEventState copyWith({
    int? id,
    String? title,
    String? image,
    String? address,
    String? duration,
  }) {
    return RecommendEventState(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      address: address ?? this.address,
      duration: duration ?? this.duration,
    );
  }

  factory RecommendEventState.fromJson(Map<String, dynamic> json) {
    return RecommendEventState(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      address: json["address"],
      duration: json["duration"],
    );
  }
}
