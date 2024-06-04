class BeforeEventState {
  final int id;
  final String image;
  final String title;
  final String address;
  final String duration;

  const BeforeEventState({
    required this.id,
    required this.image,
    required this.title,
    required this.address,
    required this.duration,
  });

  BeforeEventState copyWith({
    int? id,
    String? image,
    String? title,
    String? address,
    String? duration,
  }) {
    return BeforeEventState(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      address: address ?? this.address,
      duration: duration ?? this.duration,
    );
  }

  factory BeforeEventState.fromJson(Map<String, dynamic> json) {
    return BeforeEventState(
      id: json['event_id'] as int,
      image: json['event_image'] as String,
      title: json['name'] as String,
      address: json['address'] as String,
      duration: json['duration'] as String,
    );
  }
}
