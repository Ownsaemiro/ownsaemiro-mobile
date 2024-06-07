import 'package:get/get.dart';
import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/data/provider/base/base_connect.dart';
import 'package:ownsaemiro/data/provider/market/market_provider.dart';

class MarketProviderImpl extends BaseConnect implements MarketProvider {
  @override
  Future<Map<String, dynamic>> getTicketList(
      {required int page,
      required int size,
      required EEventCategory filter}) async {
    final Response response;

    try {
      response = await get("/api/assignments/tickets", query: {
        "page": page.toString(),
        "size": size.toString(),
        "filter": filter.enName
      });
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }

  @override
  Future<Map<String, dynamic>> getTicketDetailInfo({required int id}) async {
    final Response response;

    try {
      response = await get("/api/assignments/tickets/$id");
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }

  @override
  Future<Map<String, dynamic>> registerAssignmentTicket(
      {required int id}) async {
    final Response response;

    try {
      response = await put("/api/assignment/tickets", {"ticket_id": id});
    } catch (e) {
      rethrow;
    }

    return response.body["data"];
  }
}
