import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_admin/pages/add_chapter_page.dart';
import 'package:manga_admin/pages/add_manga_page.dart';
import 'package:manga_admin/widgets/text/head_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadText(input: 'Manga King'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(const AddMangaPage());
                },
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/home/add_manga.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Add New Manga ',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              //Add Chapters to Manga
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Get.to(const AddChapterPage());
                },
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/home/add_page.jpeg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Add Chapters ',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
