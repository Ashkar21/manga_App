import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Padding(
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
                    image: NetworkImage(
                        'https://img.freepik.com/free-vector/hand-drawn-zoom-effect-background_23-2149821652.jpg?w=1060&t=st=1713921536~exp=1713922136~hmac=7ff7530c34a73c2aec82dbc93992bc5f780dd2d2a57d387122baa426b378a4f7'), //Add a image Url here
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
          ],
        ),
      ),
    );
  }
}
