import 'package:get/get.dart';
import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/data/model/market/ticket_detail_state.dart';
import 'package:ownsaemiro/data/model/market/ticket_state.dart';
import 'package:ownsaemiro/data/provider/market/market_provider.dart';
import 'package:ownsaemiro/data/repository/market/market_repository.dart';

class MarketRepositoryImpl extends GetxService implements MarketRepository {
  late final MarketProvider _marketProvider;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _marketProvider = Get.find<MarketProvider>();
  }

  @override
  Future<List<TicketState>> getTicketList(
      {required int page,
      required int size,
      required EEventCategory filter}) async {
    Map<String, dynamic> result;

    try {
      result = await _marketProvider.getTicketList(
          page: page, size: size, filter: filter);
    } catch (e) {
      rethrow;
    }

    return result["tickets"]
        .map<TicketState>((ticket) => TicketState.fromJson(ticket))
        .toList();
  }

  @override
  Future<TicketDetailState> getTicketDetailInfo({required int id}) async {
    Map<String, dynamic> result;

    try {
      result = await _marketProvider.getTicketDetailInfo(id: id);
    } catch (e) {
      rethrow;
    }

    return TicketDetailState.fromJson(result);
  }

  @override
  Future<void> registerAssignmentTicket({required int id}) async {
    try {
      await _marketProvider.registerAssignmentTicket(id: id);
    } catch (e) {
      rethrow;
    }
  }
}
