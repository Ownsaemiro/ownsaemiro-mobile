abstract class EventRepository {
  Future<Map<String, dynamic>> getTopEventList();

  Future<Map<String, dynamic>> getRecommendEventList();
}
