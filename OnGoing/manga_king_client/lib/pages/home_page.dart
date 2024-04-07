import 'package:flutter/material.dart';

import 'package:manga_king_client/widgets/appbar.dart';
import 'package:manga_king_client/widgets/latest_updates.dart';
import 'package:manga_king_client/widgets/popular_today.dart';
import 'package:manga_king_client/widgets/search_bar.dart';
import 'package:manga_king_client/widgets/sliding.dart';
import 'package:manga_king_client/widgets/top_10.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        //Heading
        title: const AppbarWidget(),
      ),
      //Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Search Bar
            const SearchBars(),
            const SizedBox(height: 20),
            //Sliding Window
            const SlidingPhotos(),
            const SizedBox(height: 5),
            //Popular Today
            Column(
              children: [
                const Text(
                  'Popular Today',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          PopularTopday(
                            image:
                                'https://firebasestorage.googleapis.com/v0/b/manga-king-16cdd.appspot.com/o/The%20Return%20of%20the%20Crazy%20Demon%2Fimages%2FCrazyDemonCover02-1.webp?alt=media&token=23e4d0a0-98f3-40b5-ae1f-98a661c7dbf6',
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'The Return of the Crazy Demon king',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Chapter 10',
                            style: TextStyle(
                                color: Color.fromARGB(255, 79, 73, 73),
                                fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          PopularTopday(
                            image:
                                'https://firebasestorage.googleapis.com/v0/b/manga-king-16cdd.appspot.com/o/Regressing%20with%20the%20King%E2%80%99s%20Power%2FImages%2FRegressingwiththeKingsPowerCover01.png?alt=media&token=2ae0ff70-e6b5-4cfe-98b3-298d0560a46a',
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Regressing with the King\'s Power',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Chapter 10',
                            style: TextStyle(
                                color: Color.fromARGB(255, 79, 73, 73),
                                fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 35),
            //Latest Updates
            Column(
              children: [
                const Text(
                  'Latest Updates',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 204, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 35),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10), // Add space between items
                  itemBuilder: (context, index) {
                    return const LatestUpdates();
                  },
                ),
              ],
            ),
            const SizedBox(height: 35),
            //TOp 10
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 25, 24, 25),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 35),
                  const Text(
                    'Top 10',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 204, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 35),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Top10(
                        number: index,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemCount: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
