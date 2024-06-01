import 'package:flutter/material.dart';

class EventItemDescriptionWidget extends StatelessWidget {
  const EventItemDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "공연 내용 요약",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "핫소스 팝업 스토어 놀러올사람!!!\n새로나온 굿즈도 구경하고 핫소스도 만나자!!\n\n공간 협소? 노노~\n성수동 5층 건물을 통째로 빌렸다구~ 스케일부터 다르니까!\n콘텐츠로 봤던 다양한 애장품들 쫙 깔아뒀고,\n우리도 기다리고 있을테니 친구들은 와서 즐기면 돼~\n\n아주 누추한분들께서 이렇게 귀한곳까지 꼭 와주길 바래~~~~\n\n어디까지 늘어나는거에요~~~~???",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
