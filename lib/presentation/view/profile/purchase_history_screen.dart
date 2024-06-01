import 'package:flutter/material.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view/profile/widget/purchase_history_list_widget.dart';
import 'package:ownsaemiro/presentation/view_model/profile/purchase_history_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_back_appbar.dart';

class PurchaseHistoryScreen extends BaseScreen<PurchaseHistoryViewModel> {
  const PurchaseHistoryScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DefaultBackAppBar(
          title: "구매 내역",
        ));
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: PurchaseHistoryListWidget(),
        ),
      ],
    );
  }
}
