import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';

class PurchasedEventItemHeaderItem extends StatelessWidget {
  const PurchasedEventItemHeaderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          width: Get.width,
          height: Get.width * 0.6,
          color: Colors.grey,
          child: const Center(child: Text("이미지"))),
      const Stack(children: [
        Padding(
            padding: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("핫소스유니버스 팝업스토어",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(height: 8),
              Text(
                '팝업스토어 · 0분 · 전체이용가',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              Row(children: [
                Icon(Icons.location_on, color: ColorSystem.primary, size: 18),
                SizedBox(width: 4),
                Expanded(
                    child: Text("성수동2가 289-234 (보이드성수 건물)",
                        style: TextStyle(fontSize: 10, color: Colors.black)))
              ]),
              SizedBox(height: 8),
              Row(children: [
                Icon(Icons.calendar_today,
                    color: ColorSystem.primary, size: 18),
                SizedBox(width: 4),
                Text(
                  "2024.05.10 ~ 2024.05.12",
                  style: TextStyle(fontSize: 10),
                )
              ]),
              SizedBox(height: 8),
              Row(children: [
                Icon(Icons.phone, color: ColorSystem.primary, size: 18),
                SizedBox(width: 4),
                Text(
                  "02-1234-5678",
                  style: TextStyle(fontSize: 10),
                )
              ])
            ])),
      ]),
    ]);
  }
}
