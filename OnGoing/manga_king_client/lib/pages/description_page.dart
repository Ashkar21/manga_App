import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_king_client/widgets/appbar.dart';
import 'package:manga_king_client/widgets/search_bar.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const AppbarWidget(),
      ),
      body: Column(
        children: [
          const SearchBars(),
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 34, 33, 33),
                  ),
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/manga-king-16cdd.appspot.com/o/The%20Return%20of%20the%20Crazy%20Demon%2Fimages%2FCrazyDemonCover02-1.webp?alt=media&token=23e4d0a0-98f3-40b5-ae1f-98a661c7dbf6',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 10),

                GestureDetector(
                  onTap: () {
                    //Add TO book mark
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: (Get.width / 2) + 50,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmark_add,
                          color: Colors.white,
                        ),
                        Text(
                          'Bookmark',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // const Text(
                //   'The Return of the Crazy Demon king',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
