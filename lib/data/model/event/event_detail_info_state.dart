class EventDetailInfoState {
  final int id;
  final String image;
  final String title;
  final String category;
  final String durationTime;
  final String rating;
  final String address;
  final String phoneNumber;
  final int price;
  final String duration;
  bool isLiked;

  EventDetailInfoState({
    required this.id,
    required this.image,
    required this.title,
    required this.category,
    required this.durationTime,
    required this.rating,
    required this.address,
    required this.phoneNumber,
    required this.price,
    required this.duration,
    required this.isLiked,
  });

  EventDetailInfoState copyWith({
    int? id,
    String? image,
    String? title,
    String? category,
    String? durationTime,
    String? rating,
    String? address,
    String? phoneNumber,
    int? price,
    String? duration,
    bool? isLiked,
  }) {
    return EventDetailInfoState(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      category: category ?? this.category,
      durationTime: durationTime ?? this.durationTime,
      rating: rating ?? this.rating,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      price: price ?? this.price,
      duration: duration ?? this.duration,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  factory EventDetailInfoState.fromJson(Map<String, dynamic> json) {
    return EventDetailInfoState(
      id: json['id'] as int,
      image: json['image'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      durationTime: json['duration_time'] as String,
      rating: json['rating'] as String,
      address: json['address'] as String,
      phoneNumber: json['phone_number'] as String,
      price: json['price'] as int,
      duration: json['duration'] as String,
      isLiked: json['is_liked'] as bool,
    );
  }
}
