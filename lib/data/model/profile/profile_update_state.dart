class ProfileUpdateState {
  final String image;
  final String name;

  ProfileUpdateState({
    required this.image,
    required this.name,
  });

  factory ProfileUpdateState.fromJson(Map<String, dynamic> json) {
    return ProfileUpdateState(
      image: json['image'],
      name: json['nickname'],
    );
  }
}
