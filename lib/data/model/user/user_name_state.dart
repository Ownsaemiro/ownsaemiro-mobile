class UserNameState {
  final String name;

  UserNameState({required this.name});

  UserNameState copyWith({
    String? name,
  }) {
    return UserNameState(
      name: name ?? this.name,
    );
  }

  factory UserNameState.fromJson(Map<String, dynamic> json) {
    return UserNameState(
      name: json["nickname"],
    );
  }
}
