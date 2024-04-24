import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:manga_admin/controller/register_controler.dart';
import 'package:manga_admin/widgets/drop_down_button2/drop_down_button2.dart';
import 'package:manga_admin/widgets/text/head_text.dart';

class AddMangaPage extends StatelessWidget {
  const AddMangaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const HeadText(input: 'Add Mangas'),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.purple[60],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // Registration
                const Text(
                  "Registration",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 30),
                // Manga Name
                TextField(
                  controller: ctrl.nameCtrl,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.phone_android),
                    hintText: "Enter The Manga Name",
                    labelText: 'Manga Name',
                  ),
                ),
                const SizedBox(height: 40),
                // Description
                TextField(
                  controller: ctrl.descriptionCtrl,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.description),
                    hintText: "Enter The Description",
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(height: 40),
                // Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Genre
                    Drop2DownButton(
                      genderItems: const [
                        'Action',
                        'Adaptation',
                        "Adult",
                        'Adventure',
                        'Another chance',
                        'apocalypse',
                        'Comedy',
                        'Coming Soon',
                        'Crazy MC',
                        'Cultivation',
                        'cute',
                        'Demon',
                        'Discord',
                        'Drama',
                        'Dungeons',
                        'Ecchi',
                        'Fantasy',
                        'Game',
                        'Genius',
                        'Genius MC',
                        'Harem',
                        'Hero',
                        'Historical',
                        'Isekai',
                        'Josei',
                        'Kool Kids',
                        'Loli',
                        'Magic',
                        'Martial Arts',
                        'Mature',
                        'Mecha',
                        'Modern Setting',
                        'Monsters',
                        'Murim',
                        'Mystery',
                        'Necromancer',
                        'Noble',
                        'Overpowered',
                        'Pets',
                        'Post-Apocalyptic',
                        'Psychological',
                        'Rebirth',
                        'Regression',
                        'Reincarnation',
                        'Return',
                        'Returned',
                        'Returner',
                        'Revenge',
                        'Romance',
                        'School Life',
                        'Sci-fi',
                        'Seinen',
                        'Shoujo',
                        'Shounen',
                        'Slice of Life',
                        'Sports',
                        'Super Hero',
                        'Superhero',
                        'Supernatural',
                        'Survival',
                        'Suspense',
                        'System',
                        'Thriller',
                        'Time Travel',
                        'Time Travel (Future)',
                        'tower',
                        'Tragedy',
                        'Transmigrating',
                        'Video Game',
                        'Video Games',
                        'Villain',
                        'Violence',
                        'Virtual Game',
                        'Virtual Reality',
                        'Virtual World',
                        'Webtoon',
                        'Wuxia'
                      ],
                      hintText: 'Genre',
                      controller: ctrl.genreCtrl,
                    ),
                    // Type
                    Drop2DownButton(
                      genderItems: ['bad'],
                      hintText: 'Type',
                      controller: ctrl.typeCtrl,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                const SizedBox(height: 40),
                // Image Url
                TextField(
                  controller: ctrl.imageUrlCtrl,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.image),
                    hintText: "Enter The Image URL",
                    labelText: 'Image URL',
                  ),
                ),
                const SizedBox(height: 40),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    ctrl.addManga();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text('Add'),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      );
    });
  }
}
