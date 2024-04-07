import 'package:flutter/material.dart';

class ChapterTime extends StatelessWidget {
  const ChapterTime({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          '🔴 Chapter 81',
          style: TextStyle(
            color: Colors.white38,
            overflow: TextOverflow.ellipsis,
            fontSize: 15,
          ),
        ),
        SizedBox(width: 70),
        Icon(
          Icons.timer,
          color: Colors.white38,
        ),
        Text(
          '30min',
          style: TextStyle(
            color: Colors.white38,
          ),
        ),
      ],
    );
  }
}
