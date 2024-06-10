import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/utility/log_util.dart';
import 'package:ownsaemiro/data/model/notification/notification_state.dart';
import 'package:ownsaemiro/data/model/user/user_name_state.dart';
import 'package:ownsaemiro/data/repository/notification/notification_repository.dart';
import 'package:ownsaemiro/data/repository/user/user_repository.dart';

class RootViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;
  late final NotificationRepository _notificationRepository;
  late final ScrollController _scrollController;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxInt _selectedIndex;
  late final RxBool _isExpanded;
  late final Rx<UserNameState> _userNameState;
  late final RxBool _isUserNameLoading = false.obs;
  late final RxList<NotificationState> _notificationList;
  final RxBool _isLoading = false.obs;
  final RxBool _isLoadingMore = false.obs;

  int _page = 1;
  bool _hasMore = true;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  int get selectedIndex => _selectedIndex.value;

  bool get isExpanded => _isExpanded.value;

  bool get isLoading => _isLoading.value;

  UserNameState get userNameState => _userNameState.value;

  bool get isUserNameLoading => _isUserNameLoading.value;

  List<NotificationState> get notificationList => _notificationList;

  ScrollController get scrollController => _scrollController;

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  void onInit() {
    super.onInit();

    // Dependency Injection
    _userRepository = Get.find<UserRepository>();
    _notificationRepository = Get.find<NotificationRepository>();

    // Initialize State
    _selectedIndex = 0.obs;
    _isExpanded = false.obs;
    _userNameState = UserNameState(name: "").obs;
    _notificationList = <NotificationState>[].obs;
    _scrollController = ScrollController();
  }

  @override
  void onReady() async {
    super.onReady();

    _isUserNameLoading.value = true;
    await _userRepository.getUsername().then((value) {
      _userNameState.value = value;
    });

    _isUserNameLoading.value = false;

    _loadData();
  }

  void _loadData() async {
    _notificationList.clear();

    if (_isLoading.value) return;
    _isLoading.value = true;

    try {
      final data = await _notificationRepository.getNotificationList(
          page: _page, size: 8);

      if (data.isNotEmpty) {
        _notificationList.addAll(data);
        _page += 2;
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoading.value = false;
    }
  }

  void loadMore() async {
    if (_isLoadingMore.value || !_hasMore) return;

    _isLoadingMore.value = true;

    try {
      final data = await _notificationRepository.getNotificationList(
          page: _page, size: 4);

      if (data.isNotEmpty) {
        for (var i = 0; i < data.length; i++) {
          final index = _notificationList.length;

          _notificationList.add(data[i]);
          listKey.currentState?.insertItem(index);
        }

        _page++;

        LogUtil.debug("Load More: ${_notificationList.length}");
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoadingMore.value = false;
    }
  }

  void deleteNotification(int index) {
    final removedItem = _notificationList[index];

    _notificationList.removeAt(index);
    _notificationRepository.deleteNotification(id: removedItem.id);

    listKey.currentState?.removeItem(
      index,
      (context, animation) => FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/notify.svg',
                    height: 42,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          removedItem.title,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          removedItem.body,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                          overflow: TextOverflow.clip,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.close, color: Colors.grey),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    update();
  }

  void updateUserName(String name) {
    _userNameState.value = _userNameState.value.copyWith(name: name);

    update();
  }

  void changeIndex(int index) {
    _selectedIndex.value = index;
  }

  void onClickFloatingActionButton() {
    _isExpanded.value = !_isExpanded.value;
  }
}
