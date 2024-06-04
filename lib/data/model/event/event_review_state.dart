class EventReviewState {
  final int id;
  final String nickname;
  final String profileImage;
  final String content;

  const EventReviewState({
    required this.id,
    required this.nickname,
    required this.profileImage,
    required this.content,
  });

  EventReviewState copyWith({
    int? id,
    String? nickname,
    String? profileImage,
    String? content,
  }) {
    return EventReviewState(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      profileImage: profileImage ?? this.profileImage,
      content: content ?? this.content,
    );
  }

  factory EventReviewState.fromJson(Map<String, dynamic> json) {
    return EventReviewState(
      id: json['id'] as int,
      nickname: json['nickname'] as String,
      profileImage: json['profile_image'] as String,
      content: json['content'] as String,
    );
  }
}
