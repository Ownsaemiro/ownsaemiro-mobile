import 'package:flutter/material.dart';
import 'package:ownsaemiro/core/screen/base_screen.dart';
import 'package:ownsaemiro/presentation/view_model/market/market_view_model.dart';

class MarketScreen extends BaseScreen<MarketViewModel> {
  const MarketScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Market Screen'),
    );
  }
}
