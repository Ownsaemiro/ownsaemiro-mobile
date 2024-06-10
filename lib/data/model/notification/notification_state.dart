class NotificationState {
  final int id;
  final String title;
  final String body;

  NotificationState({
    required this.id,
    required this.title,
    required this.body,
  });

  NotificationState copyWith({
    int? id,
    String? title,
    String? body,
  }) {
    return NotificationState(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  factory NotificationState.fromJson(Map<String, dynamic> json) {
    return NotificationState(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
