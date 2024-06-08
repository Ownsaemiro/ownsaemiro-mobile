import 'package:get/get.dart';
import 'package:ownsaemiro/app/type/e_event_category.dart';
import 'package:ownsaemiro/data/model/market/ticket_state.dart';
import 'package:ownsaemiro/data/repository/market/market_repository.dart';

class MarketViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final MarketRepository _marketRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<TicketState> _ticketList;
  late final Rx<EEventCategory> _eventCategory;
  late final RxBool _isStateLoading = false.obs;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<TicketState> get ticketList => _ticketList;

  bool get isStateLoading => _isStateLoading.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _marketRepository = Get.find<MarketRepository>();

    // Initialize State
    _eventCategory = EEventCategory.all.obs;
    _ticketList = <TicketState>[].obs;
  }

  @override
  void onReady() async {
    super.onReady();

    _isStateLoading.value = true;

    await _marketRepository
        .getTicketList(page: 1, size: 8, filter: EEventCategory.all)
        .then((value) {
      _ticketList.addAll(value);
    });

    _isStateLoading.value = false;
  }

  final RxInt selectedIndex = 0.obs;

  final List<String> chipList = [
    "전체",
    "뮤지컬",
    "전시",
    "연극",
    "콘서트",
    "스포츠",
  ];

  void selectCategory(int index) async {
    selectedIndex.value = index;
    String category = chipList[index];

    _eventCategory.value = EEventCategory.fromKoName(category);

    _ticketList.clear();

    _isStateLoading.value = true;

    await _marketRepository
        .getTicketList(page: 1, size: 8, filter: _eventCategory.value)
        .then((value) {
      _ticketList.addAll(value);
    });

    _isStateLoading.value = false;
  }
}
