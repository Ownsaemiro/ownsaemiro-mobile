import 'package:flutter/material.dart';
import 'package:get/get.dart';

@immutable
abstract class BaseScreen<T extends GetxController> extends GetView<T> {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!viewModel.initialized) {
      initViewModel();
    }

    return Container(
      decoration: BoxDecoration(
        color: unSafeAreaColor,
        image: backgroundImagePath != null
            ? DecorationImage(
                image: AssetImage(backgroundImagePath!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: wrapWithOuterSafeArea
          ? SafeArea(
              top: setTopOuterSafeArea,
              bottom: setBottomOuterSafeArea,
              child: _buildScaffold(context),
            )
          : _buildScaffold(context),
    );
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      extendBody: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: screenBackgroundColor,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: buildFloatingActionButton,
      appBar: buildAppBar(context),
      body: wrapWithInnerSafeArea
          ? SafeArea(
              top: setTopInnerSafeArea,
              bottom: setBottomInnerSafeArea,
              child: buildBody(context),
            )
          : buildBody(context),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  @protected
  void initViewModel() {
    viewModel.initialized;
  }

  @protected
  T get viewModel => controller;

  @protected
  Color? get unSafeAreaColor => Colors.white;

  @protected
  String? get backgroundImagePath => null;

  @protected
  bool get resizeToAvoidBottomInset => true;

  @protected
  Widget? get buildFloatingActionButton => null;

  @protected
  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  @protected
  bool get extendBodyBehindAppBar => false;

  @protected
  Color? get screenBackgroundColor => Colors.transparent;

  @protected
  bool get wrapWithOuterSafeArea => false;

  @protected
  bool get setTopOuterSafeArea => false;

  @protected
  bool get setBottomOuterSafeArea => false;

  @protected
  bool get wrapWithInnerSafeArea => false;

  @protected
  bool get setTopInnerSafeArea => false;

  @protected
  bool get setBottomInnerSafeArea => false;

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @protected
  Widget buildBody(BuildContext context);

  @protected
  Widget? buildBottomNavigationBar(BuildContext context) => null;
}
