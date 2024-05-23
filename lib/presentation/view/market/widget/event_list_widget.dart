import 'package:flutter/material.dart';

class EventListWidget extends StatelessWidget {
  const EventListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        // Parent widget의 크기에 맞게 스크롤
        physics: const AlwaysScrollableScrollPhysics(),

        // ListView의 크기를 줄여주는 속성
        shrinkWrap: true,
        itemCount: 20,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
          height: 32,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SizedBox(
                width: 72,
                height: 72,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                )),
            title: const Text(
              '공연명',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              '2024.05.10 ~ 2024.05.12',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
