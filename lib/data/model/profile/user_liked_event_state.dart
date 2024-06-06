class UserLikedEventState {
  final int id;
  final String name;
  final String image;
  final String duration;
  final bool isLiked;

  UserLikedEventState({
    required this.id,
    required this.name,
    required this.image,
    required this.duration,
    required this.isLiked,
  });

  UserLikedEventState copyWith({
    int? id,
    String? name,
    String? image,
    String? duration,
    bool? isLiked,
  }) {
    return UserLikedEventState(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      duration: duration ?? this.duration,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  factory UserLikedEventState.fromJson(Map<String, dynamic> json) {
    return UserLikedEventState(
      id: json['event_id'],
      name: json['name'],
      image: json['image'],
      duration: json['duration'],
      isLiked: json['is_liked'],
    );
  }
}
