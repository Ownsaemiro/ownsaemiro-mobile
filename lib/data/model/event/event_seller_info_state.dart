class EventSellerInfoState {
  final String director;
  final String durationTime;
  final String rating;
  final String address;

  const EventSellerInfoState({
    required this.director,
    required this.durationTime,
    required this.rating,
    required this.address,
  });

  EventSellerInfoState copyWith({
    String? director,
    String? durationTime,
    String? rating,
    String? address,
  }) {
    return EventSellerInfoState(
      director: director ?? this.director,
      durationTime: durationTime ?? this.durationTime,
      rating: rating ?? this.rating,
      address: address ?? this.address,
    );
  }

  factory EventSellerInfoState.fromJson(Map<String, dynamic> json) {
    return EventSellerInfoState(
      director: json['director'] as String,
      durationTime: json['duration_time'] as String,
      rating: json['rating'] as String,
      address: json['address'] as String,
    );
  }
}
