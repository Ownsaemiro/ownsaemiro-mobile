abstract class EventProvider {
  Future<Map<String, dynamic>> getTopEventList();

  Future<Map<String, dynamic>> getRecommendEventList();
}
