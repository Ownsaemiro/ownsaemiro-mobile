import 'package:flutter/material.dart';
import 'package:get/get.dart';

@immutable
abstract class BaseWidget<T extends GetxController> extends GetView<T> {
  const BaseWidget({super.key});

  T get viewModel => controller;

  @override
  Widget build(BuildContext context) {
    return buildView(context);
  }

  Widget buildView(BuildContext context);
}
