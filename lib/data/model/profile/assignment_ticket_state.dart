class AssignmentTicketState {
  final String image;
  final String title;
  final String duration;
  final String status;

  AssignmentTicketState({
    required this.image,
    required this.title,
    required this.duration,
    required this.status,
  });

  AssignmentTicketState copyWith({
    String? image,
    String? title,
    String? duration,
    String? status,
  }) {
    return AssignmentTicketState(
      image: image ?? this.image,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      status: status ?? this.status,
    );
  }

  factory AssignmentTicketState.fromJson(Map<String, dynamic> json) {
    return AssignmentTicketState(
        image: json['image'],
        title: json['title'],
        duration: json['duration'],
        status: json['status']);
  }
}
