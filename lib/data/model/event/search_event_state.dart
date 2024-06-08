class SearchEventState {
  final int eventId;
  final String eventImage;
  final String eventName;
  final String address;
  final String duration;

  SearchEventState({
    required this.eventId,
    required this.eventImage,
    required this.eventName,
    required this.address,
    required this.duration,
  });

  SearchEventState copyWith({
    int? eventId,
    String? eventImage,
    String? eventName,
    String? address,
    String? duration,
  }) {
    return SearchEventState(
      eventId: eventId ?? this.eventId,
      eventImage: eventImage ?? this.eventImage,
      eventName: eventName ?? this.eventName,
      address: address ?? this.address,
      duration: duration ?? this.duration,
    );
  }

  factory SearchEventState.fromJson(Map<String, dynamic> json) {
    return SearchEventState(
      eventId: json['event_id'] as int,
      eventImage: json['event_image'] as String,
      eventName: json['name'] as String,
      address: json['address'] as String,
      duration: json['duration'] as String,
    );
  }
}
