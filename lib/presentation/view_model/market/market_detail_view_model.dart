import 'package:get/get.dart';
import 'package:ownsaemiro/data/model/market/ticket_detail_state.dart';
import 'package:ownsaemiro/data/repository/market/market_repository.dart';

class MarketDetailViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final MarketRepository _marketRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final Rx<TicketDetailState> _ticketDetailState;
  late final RxBool _isStateLoading = false.obs;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  TicketDetailState get ticketDetailState => _ticketDetailState.value;

  bool get isStateLoading => _isStateLoading.value;

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _marketRepository = Get.find<MarketRepository>();

    // Initialize State
    _ticketDetailState = TicketDetailState(
            id: 0,
            title: "",
            image: "https://i.esdrop.com/d/f/hhaNifrpr0/U3CCAUKVbb.png",
            category: "",
            durationTime: "",
            rating: "",
            address: "",
            phoneNumber: "",
            date: "",
            description: "",
            isLiked: false)
        .obs;
  }

  void setMarketDetailInfoState(int id) {
    _isStateLoading.value = true;
    _marketRepository.getTicketDetailInfo(id: id).then((value) {
      _ticketDetailState.value = value;
    });

    _isStateLoading.value = false;
  }
}
