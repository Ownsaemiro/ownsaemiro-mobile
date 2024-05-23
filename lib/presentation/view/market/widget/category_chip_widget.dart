import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';
import 'package:ownsaemiro/core/screen/base_widget.dart';
import 'package:ownsaemiro/presentation/view_model/event/event_view_model.dart';

class CategoryChipWidget extends BaseWidget<EventViewModel> {
  const CategoryChipWidget({super.key});

  @override
  Widget buildView(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: List<Widget>.generate(controller.chipList.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Obx(() => ChoiceChip(
                    showCheckmark: false,
                    label: Text(controller.chipList[index]),
                    selected: controller.selectedIndex.value == index,
                    onSelected: (selected) {
                      controller.selectCategory(index);
                    },
                    selectedColor: ColorSystem.primary,
                    backgroundColor: ColorSystem.white,
                    labelStyle: TextStyle(
                      color: controller.selectedIndex.value == index
                          ? ColorSystem.white
                          : ColorSystem.black,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: controller.selectedIndex.value == index
                            ? ColorSystem.primary
                            : ColorSystem.black,
                      ),
                    ),
                  )),
            );
          }),
        ),
      ),
    );
  }
}
