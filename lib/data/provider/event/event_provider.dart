abstract class EventProvider {
  Future<Map<String, dynamic>> getPopularEventList();

  Future<Map<String, dynamic>> getRecommendEventList();
}
