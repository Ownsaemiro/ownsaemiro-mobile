class EventDetailBriefState {
  final String description;

  const EventDetailBriefState({
    required this.description,
  });

  EventDetailBriefState copyWith({
    String? description,
  }) {
    return EventDetailBriefState(
      description: description ?? this.description,
    );
  }

  factory EventDetailBriefState.fromJson(Map<String, dynamic> json) {
    return EventDetailBriefState(
      description: json['description'] as String,
    );
  }
}
