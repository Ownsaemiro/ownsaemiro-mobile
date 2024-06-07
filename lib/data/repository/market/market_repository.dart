import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/data/model/market/ticket_detail_state.dart';
import 'package:ownsaemiro/data/model/market/ticket_state.dart';

abstract class MarketRepository {
  Future<List<TicketState>> getTicketList(
      {required int page, required int size, required EEventCategory filter});

  Future<TicketDetailState> getTicketDetailInfo({required int id});

  Future<void> registerAssignmentTicket({required int id});
}
