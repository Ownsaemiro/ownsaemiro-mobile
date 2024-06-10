class AssignmentTicketState {
  final int id;
  final String image;
  final String title;
  final String duration;
  final String status;

  AssignmentTicketState({
    required this.id,
    required this.image,
    required this.title,
    required this.duration,
    required this.status,
  });

  AssignmentTicketState copyWith({
    int? id,
    String? image,
    String? title,
    String? duration,
    String? status,
  }) {
    return AssignmentTicketState(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      status: status ?? this.status,
    );
  }

  factory AssignmentTicketState.fromJson(Map<String, dynamic> json) {
    return AssignmentTicketState(
        id: json['id'],
        image: json['image'],
        title: json['title'],
        duration: json['duration'],
        status: json['status']);
  }
}
