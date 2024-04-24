import 'package:flutter/material.dart';

class HeadText extends StatelessWidget {
  final String input;
  const HeadText({
    Key? key,
    required this.input,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String firstPart = '';
    String secondPart = '';

    if (input.contains(' ')) {
      List<String> parts = input.split(' ');
      firstPart = parts[0];
      secondPart = parts[1];
    } else {
      firstPart = input;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstPart,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          secondPart,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      ],
    );
  }
}
