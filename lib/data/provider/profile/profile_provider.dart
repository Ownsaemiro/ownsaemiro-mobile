abstract class ProfileProvider {
  Future<Map<String, dynamic>> getUserLikedEvent(
      {required int page, required int size});
}
