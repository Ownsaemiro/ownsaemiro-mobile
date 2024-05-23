import 'package:flutter/material.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view/market/widget/category_chip_widget.dart';
import 'package:ownsaemiro/presentation/view/market/widget/event_list_widget.dart';
import 'package:ownsaemiro/presentation/view_model/market/market_view_model.dart';
import 'package:ownsaemiro/presentation/widget/appbar/default_search_appbar.dart';

class MarketScreen extends BaseScreen<MarketViewModel> {
  const MarketScreen({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: DefaultSearchAppBar(),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryChipWidget(),
        Expanded(
          child: EventListWidget(),
        ),
      ],
    );
  }
}
