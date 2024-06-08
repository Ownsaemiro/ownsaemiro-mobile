class ReviewState {
  final String name;
  final String image;
  final String content;

  ReviewState({
    required this.name,
    required this.image,
    required this.content,
  });

  ReviewState copyWith({
    String? name,
    String? image,
    String? content,
  }) {
    return ReviewState(
      name: name ?? this.name,
      image: image ?? this.image,
      content: content ?? this.content,
    );
  }

  factory ReviewState.fromJson(Map<String, dynamic> json) {
    return ReviewState(
      name: json['nickname'],
      image: json['profile_image'],
      content: json['content'],
    );
  }
}
