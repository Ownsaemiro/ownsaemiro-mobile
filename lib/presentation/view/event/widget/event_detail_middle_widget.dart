import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ownsaemiro/app/config/color_system.dart';

class EventDetailMiddleWidget extends StatelessWidget {
  const EventDetailMiddleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = Get.width;

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: ColorSystem.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: ColorSystem.primary,
            indicator: UnderlineTabIndicator(
              borderSide:
                  const BorderSide(width: 2, color: ColorSystem.primary),
              insets: EdgeInsets.symmetric(horizontal: (width / 3.32)),
            ),
            tabs: const [
              Tab(text: "공연정보"),
              Tab(text: "판매정보"),
            ],
          ),
          SizedBox(
            height: Get.height * 0.8,
            child: TabBarView(
              children: [
                _PerformanceInfoTab(),
                IntrinsicHeight(child: _SellerInfoTab()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PerformanceInfoTab extends StatelessWidget {
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
              "핫소스 팝업 스토어 놀러올사람!!!\n새로나온 굿즈도 구경하고 핫소스도 만나자!!\n\n공간 협소? 노노~\n성수동 5층 건물을 통째로 빌렸다구~ 스케일부터 다르니까!\n콘텐츠로 봤던 다양한 애장품들 쫙 깔아뒀고,\n우리도 기다리고 있을테니 친구들은 와서 즐기면 돼~\n\n아주 누추한분들께서 이렇게 귀한곳까지 꼭 와주길 바래~~~~",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 32),
            _EventDetailReviewWidget(),
          ],
        ));
  }
}

//
class _SellerInfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
          },
          border: TableBorder.symmetric(
            inside: BorderSide(color: Colors.grey.shade300, width: 0.5),
          ),
          children: const [
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '주최/기획',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('핫소스유니버스', textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('공연시간',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('20분', textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('관람등급',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('초등학생이상 관람가', textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('공연장소',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('성수동2가', textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

//
class _EventDetailReviewWidget extends StatelessWidget {
  const _EventDetailReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> reviews = [
      "가운데 정렬로 하는 게 좋을지 고민임",
      "이거슨 리뷰입니다.",
      "몇글자까지되는거에요몇글자까지되는거에요몇글자까지되는거에요몇글자까지되는거에요몇글자까지되는거에요몇글자까지되는거에요몇글자까지되는거에요몇글자까지되는거에요몇글자까지되는거에요몇글자까지되는거에요"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            "공연 후기",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
              onTap: () {},
              child: const Text("후기 전체보기",
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorSystem.primary,
                  )))
        ]),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            final review = reviews[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey.shade300,
                          child: const Icon(Icons.person, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '사용자 이름',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Center(
                        child: Text(
                          review,
                          style: const TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
