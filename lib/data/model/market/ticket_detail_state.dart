class TicketDetailState {
  final int id;
  final String title;
  final String image;
  final String category;
  final String durationTime;
  final String rating;
  final String address;
  final String phoneNumber;
  final String description;
  final String date;
  final bool isLiked;

  TicketDetailState({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
    required this.durationTime,
    required this.rating,
    required this.address,
    required this.phoneNumber,
    required this.description,
    required this.date,
    required this.isLiked,
  });

  TicketDetailState copyWith({
    int? id,
    String? title,
    String? image,
    String? category,
    String? durationTime,
    String? rating,
    String? address,
    String? phoneNumber,
    String? description,
    String? date,
    bool? isLiked,
  }) {
    return TicketDetailState(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      category: category ?? this.category,
      durationTime: durationTime ?? this.durationTime,
      rating: rating ?? this.rating,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      description: description ?? this.description,
      date: date ?? this.date,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  factory TicketDetailState.fromJson(Map<String, dynamic> json) {
    return TicketDetailState(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      category: json['category'],
      durationTime: json['duration_time'],
      rating: json['rating'],
      address: json['address'],
      phoneNumber: json['phone_number'],
      description: json['description'],
      date: json['date'],
      isLiked: json['is_liked'],
    );
  }
}
