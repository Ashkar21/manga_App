import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_king_client/widgets/chapter_time.dart';

class LatestUpdates extends StatelessWidget {
  const LatestUpdates({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          'https://img.asuracomics.com/unsafe/fit-in/200x260/filters:format(webp)/https://asuratoon.com/wp-content/uploads/2022/07/Reaper-Moon-Cover-Animation_Compressed.gif',
          width: Get.width / 3,
          height: 200,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reaper of the Drifting Moon',
                style: TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 25),
              ChapterTime(),
              SizedBox(height: 25),
              ChapterTime(),
              SizedBox(height: 25),
              ChapterTime(),
            ],
          ),
        )
      ],
    );
  }
}
