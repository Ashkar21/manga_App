import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_king_client/widgets/appbar.dart';
import 'package:manga_king_client/widgets/chapter_list.dart';
import 'package:manga_king_client/widgets/search_bar.dart';

class DescriptionPage extends StatelessWidget {
  final String manga;
  const DescriptionPage({Key? key, required this.manga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const AppbarWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  const SizedBox(height: 10),
                  const Text(
                    'The Return of the Crazy Demon King',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),

                  //COntent
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 30),
                    child: Text(
                      'Yi Zaha. The crazy demon crazy for martial arts\nWhile he was running away after stealing the heavenly pearl of the Demon Cult Leader, he fell off a cliff.\nAfter thinking that everything was over, he opened his eyes to see that he had returned back to when he was a waiter…\nAnd he is being beat up for something that he didn’t do.\nThe crazy demon who returned to the beginning of his days as a waiter!\nWill he go crazy again, or will he drive his enemies crazy?\n',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //Chapeter First and Last
                  Row(
                    children: [
                      Container(
                        width: Get.width / 2 - 10,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Chapter 1',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        width: Get.width / 2 - 10,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Chapter 180',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const ChapterList();
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemCount: 5,
                    clipBehavior: Clip.hardEdge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
