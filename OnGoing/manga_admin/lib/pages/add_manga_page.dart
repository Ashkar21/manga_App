import 'package:flutter/material.dart';
import 'package:manga_admin/widgets/text/head_text.dart';

class AddMangaPage extends StatelessWidget {
  const AddMangaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadText(input: 'Add Mangas'),
      ),
    );
  }
}
