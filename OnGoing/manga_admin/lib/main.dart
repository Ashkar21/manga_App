import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_admin/controller/add_chapter_controller.dart';
import 'package:manga_admin/controller/register_controler.dart';
import 'package:manga_admin/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    // ignore: avoid_print
    print('Error initializing Firebase: $e');
  }
  runApp(const MyApp());
  Get.put(RegisterController());
  Get.put(AddChapterController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Manga Admin',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: const Color.fromARGB(66, 255, 255, 255),
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
