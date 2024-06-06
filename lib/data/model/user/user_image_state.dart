class UserImageState {
  final String profileImage;

  UserImageState({required this.profileImage});

  UserImageState copyWith({
    String? profileImage,
  }) {
    return UserImageState(
      profileImage: profileImage ?? this.profileImage,
    );
  }

  factory UserImageState.fromJson(Map<String, dynamic> json) {
    return UserImageState(
      profileImage: json["profile_image"],
    );
  }
}
