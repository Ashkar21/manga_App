import 'package:flutter/material.dart';

class ChapterList extends StatelessWidget {
  const ChapterList({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Text(
          'Chapter 1',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
