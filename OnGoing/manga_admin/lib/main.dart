import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_admin/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Manga Admin',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: const Color.fromARGB(66, 64, 62, 62),
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
