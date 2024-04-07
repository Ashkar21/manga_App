import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Top10 extends StatelessWidget {
  final int number;
  const Top10({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5),
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white),
          ),
          child: Center(
            child: Text(
              (number + 1).toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Image.network(
          'https://img.asuracomics.com/unsafe/fit-in/130x170/filters:format(webp)/https://asuratoon.com/wp-content/uploads/2023/04/IronBloodSwordHound05-1.png',
          width: Get.width / 4,
          height: 200,
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: Get.width - 180,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Revenge of the Iron-Blooded Sword Hound',
                style: TextStyle(
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 15),
              Text(
                'Genres : Action, Adventure, Fantasy, MartialArts, Returner, Revenge, Supernatural',
                style: TextStyle(
                  color: Colors.white38,
                ),
                overflow: TextOverflow.fade,
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }
}
