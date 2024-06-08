abstract class ProfileProvider {
  Future<Map<String, dynamic>> getUserLikedEvent(
      {required int page, required int size});

  Future<Map<String, dynamic>> getPurchasedList(
      {required int page, required int size});

  Future<Map<String, dynamic>> getPurchasedDetail({required int id});

  Future<Map<String, dynamic>> getAssignmentList(
      {required int page, required int size});
}
