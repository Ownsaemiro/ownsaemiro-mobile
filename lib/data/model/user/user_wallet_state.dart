class UserWalletState {
  int point;

  UserWalletState({
    required this.point,
  });

  UserWalletState copyWith({
    int? point,
  }) {
    return UserWalletState(
      point: point ?? this.point,
    );
  }

  factory UserWalletState.fromJson(Map<String, dynamic> json) {
    return UserWalletState(
      point: json["point"],
    );
  }
}
