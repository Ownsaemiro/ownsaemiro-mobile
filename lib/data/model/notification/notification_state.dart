class NotificationState {
  final String? content;
  final bool isDeleted;

  NotificationState({
    this.content,
    required this.isDeleted,
  });

  NotificationState copyWith({
    String? content,
  }) {
    return NotificationState(
      content: content ?? this.content,
      isDeleted: isDeleted,
    );
  }
}
