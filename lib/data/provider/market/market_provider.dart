import 'package:ownsaemiro/app/type/e_event_category.dart';

abstract class MarketProvider {
  Future<Map<String, dynamic>> getTicketList(
      {required int page, required int size, required EEventCategory filter});

  Future<Map<String, dynamic>> getTicketDetailInfo({required int id});

  Future<Map<String, dynamic>> registerAssignmentTicket({required int id});
}
