import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PopularTopday extends StatelessWidget {
  String image;
  PopularTopday({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: (Get.width / 2) - 5,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 17, 17, 16),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
