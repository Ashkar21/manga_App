import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBars extends StatelessWidget {
  const SearchBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.purple,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 40,
              color: Colors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(6),
            width: Get.width - 70,
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
              ), // Set typing text color
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 0, 0, 0),
                hintText: 'Search Here',
                hintStyle: const TextStyle(
                  color: Colors.grey, // Change hint text color
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.purple, // Change search icon color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ), // Change border color
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ), // Change focused border color
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ), // Adjust content padding
              ),
            ),
          )
        ],
      ),
    );
  }
}
